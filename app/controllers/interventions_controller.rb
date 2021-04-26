require 'zendesk_api'
class InterventionsController < ApplicationController
     authorize_resource

    def home
    end
    
    def index   
        @customers = Customer.all  
        @intervention = Intervention.new 
    end

    def get_customers
        @customers = Customer.all
    end

    def create 
        @intervention = Intervention.new
        puts intervention_params

        @intervention.author = current_user.id
        @intervention.employee_id = intervention_params[:employee_id]
        @intervention.customer_id = intervention_params[:customer_id]
        @intervention.building_id = intervention_params[:building_id]
        @intervention.battery_id = intervention_params[:battery_id]
        @intervention.report = intervention_params[:report]
        if intervention_params[:column_id] == 'None' || intervention_params[:column_id] == 0
            @intervention.column_id = nil
        else
            @intervention.column_id = intervention_params[:column_id] 
        end
        if intervention_params[:elevator_id] == 'None' || intervention_params[:elevator_id] == 0
            @intervention.elevator_id = nil
        else
             @intervention.elevator_id = intervention_params[:elevator_id] 
        end
        @intervention.save!
        puts '=============================================================='
        puts @intervention.id

        respond_to do |format|
            if @intervention.save!
              createTicket()
              format.html { redirect_to "/", notice: "Intervention was successfully created." }
            else
              format.html { redirect_to "/", notice: "There was an error creating the intervention" }
            end
          end
    end

    def get_buildings
        if params[:customer].present?
            if (params[:building] != "None")
                @buildings = Customer.find(params[:customer]).buildings
            else 
                @buildings = []
            end
        else
            @buildings = Building.all
        end
        if request.xhr?
            respond_to do |format|
                format.json {
                    render json: {buildings: @buildings}
                }
            end
        end
    end

    def get_batteries
        if params[:building].present?    
            if (params[:building] != "None")
                @batteries = Building.find(params[:building]).batteries
            else 
                @batteries = []
            end
        else
            @batteries = Battery.all
        end
        if request.xhr?
            respond_to do |format|
                format.json {
                    render json: {batteries: @batteries}
                }
            end
        end
    end
    
    def get_columns
        if params[:battery].present?
            if (params[:battery] != "None")
                @columns = Battery.find(params[:battery]).columns
            else 
                @columns = []
            end
        else
            @columns = Column.all
        end
        if request.xhr?
            respond_to do |format|
                format.json {
                    render json: {columns: @columns}
                }
            end
        end
    end

    def get_elevators
        if params[:column].present?
            if (params[:column] != "None")
                @elevators = Column.find(params[:column]).elevators
            else 
                @elevators = []
            end
        else
            @elevators = Elevator.all
        end
        if request.xhr?
            respond_to do |format|
                format.json {
                    render json: {elevators: @elevators}
                }
            end
        end
    end

    def createTicket()
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV['ZENDESK_URL']
            config.username = ENV['ZENDESK_EMAIL']
            config.token = ENV['ZENDESK_API']
          end

          employee_name = (Employee.find(@intervention.author).first_name)
    
          ZendeskAPI::Ticket.create!(client,
            :subject => "New Intervention by #{Employee.find(@intervention.author).first_name} #{Employee.find(@intervention.author).last_name}",
            :comment => { :value =>
              "#{employee_name} created a new intervention with the following customer: 
              #{Customer.find(@intervention.customer_id).company_contact_full_name} with #{Customer.find(@intervention.customer_id).company_name}, with the following informations: 
              #{Employee.find(@intervention.employee_id).first_name} #{Employee.find(@intervention.employee_id).last_name} is the assigned employee.
              Description of the intervention: #{@intervention.report.to_s}.
              Building id: #{@intervention.building_id}
              Battery id: #{@intervention.battery_id} 
              #{if @intervention.column_id != nil then 'Column id: ' end} #{if @intervention.column_id != nil then @intervention.column_id end} 
              #{if @intervention.elevator_id != nil then 'Elevator id: ' end} #{if @intervention.elevator_id != nil then @intervention.elevator_id end}"
             },
            :type => "problem",
            :priority => "normal")
      end

    private 

        def intervention_params
            params.require(:intervention).permit(
                :employee_id,
                :customer_id,
                :building_id,
                :battery_id,
                :column_id,
                :elevator_id,
                :report
            )
        end
end