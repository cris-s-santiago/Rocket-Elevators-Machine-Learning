#!/usr/bin/ruby
require 'pg'
require 'yaml'


class Pgsync

    attr_accessor :conn, :host, :port, :database, :user, :password

    def initialize
        # puts "init debut"
        self.info
        self.connection
        # puts "init fin"
    end

    def info
        # puts "debut info"
        info = YAML.load(File.read("./config/pg.yml"))
        # puts info
        self.host = info["development"]["host"]
        # puts "host #{self.host}"
        self.database = info["development"]["database"]
        # puts "database #{self.database}"
        self.user = info["development"]["username"]
        # puts "user #{self.user}"
        self.password = info["development"]["password"]
        # puts "password #{self.password}"
        self.port = info["development"]["port"]
        # puts "port #{self.port}"
    end

    def connection
        self.conn = PG.connect(
            host: self.host,
            dbname: self.database,
            port: self.port,
            user: self.user,
            password: self.password
        )
        # puts "connection"
    end

    #CREATING TABLES VIA creating_tables.txt
    def create_tables
        self.conn.exec(
            File.read("./lib/creating_tables.txt")
            
        )
    end

    def sync_mysql
        self.sync_quotes
        self.sync_contact
        self.sync_elevator
        self.sync_customers
    end

    def sync_quotes
        Quote.all.each do | quote |
            sql = "INSERT INTO fact_quotes(quote_id, creation_date, company_name, nb_elevator, email)
            VALUES (#{quote.id},'#{quote.created_at}','#{quote.company_name.gsub!(/[^0-9A-Za-z]/, '')}',#{quote.number_of_elevators},'#{quote.email}');"
            self.conn.exec(sql)
        end
    end

    def sync_elevator
        Elevator.all.each do | elevator |
            address = Address.find(elevator.column.battery.building.address_id)
            sql = "INSERT INTO fact_elevator(serial_number, date_of_commissioning, building_id, customer_id, building_city)
            VALUES (#{elevator.id},'#{elevator.date_of_commissioning}',#{elevator.column_id},#{elevator.column.battery.building.customer_id},'#{address.city.gsub!(/[^0-9A-Za-z]/, '')}');"
            self.conn.exec(sql)
        end
    end

    def sync_contact
        Lead.all.each do | lead |
            sql = "INSERT INTO fact_contact(contact_id, creation_date, company_name, email, project_name)
            VALUES (#{lead.id},'#{lead.created_at}','#{lead.company_name.gsub!(/[^0-9A-Za-z]/, '')}','#{lead.email}','#{lead.project_name}');"
            self.conn.exec(sql)
        end
    end

    def sync_customers
        Customer.all.each do | customer |
            amountOfElevator = 0
            customer.buildings.each do |building|
                building.batteries.each do |battery|
                    battery.columns.each do |column|
                        column.elevators.each do |elevator|
                            amountOfElevator += 1
                        end
                    end
                end
            end
            address = Address.find(customer.address_id)
            sql = "INSERT INTO dim_customers(creation_date, company_name, full_name_company_main_contact, email_of_company_main_contact, nb_elevators, customers_city)
            VALUES ('#{customer.created_at}','#{customer.company_name.gsub!(/[^0-9A-Za-z]/, '')}','#{customer.service_technical_authority_full_name.gsub!(/[^0-9A-Za-z]/, '')}','#{customer.service_technical_authority_email}','#{amountOfElevator}','#{address.city}');"
            self.conn.exec(sql)
        end
    end
end

 