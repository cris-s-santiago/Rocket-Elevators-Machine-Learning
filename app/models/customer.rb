require 'dropbox'

class Customer < ApplicationRecord
    
    belongs_to :address
    has_many :buildings
    # has_many :fact_interventions

    after_create :dropbox_file

    private 

    def dropbox_file

        dbx = Dropbox::Client.new(ENV['DROPBOX_TOKEN'])
        num = 1
        path= self.company_email

        Lead.all.each do |lead|
            if lead.email == self.company_email
                begin
                    file = dbx.upload("/#{path}/#{lead.file_name}", "#{lead.file_data}") # => Dropbox::FileMetadata
                rescue => exception
                    num += 1
                    name = lead.file_name.split('.')
                    new_name = name[0] + num.to_s + '.' +name[1]
                    file = dbx.upload("/#{path}/#{new_name}", "#{lead.file_data}") # => Dropbox::FileMetadata
                    Lead.where(:id => lead.id).update(:file_name => new_name)
                end
                Lead.where(:id => lead.id).update(:file_data => nil)
            end
        end
        

    end

end
