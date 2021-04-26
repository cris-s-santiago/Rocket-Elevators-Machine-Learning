require 'httparty'

class Elevator < ApplicationRecord
    include ActiveModel::Dirty
    belongs_to :column
    # belongs_to :battery , optional: true
    # belongs_to :building, optional: true

    before_update :sendMsg
    before_update :check_intervention

    private
    def sendMsg
        if self.status_changed?
            url = ENV['SLACK_URL']
            msg = "The Elevator #{self.id} with Serial Number #{self.serial_number} changed status from #{self.status_was} to #{self.status}"
            HTTParty.post(url, body: {"text":"#{msg}"}.to_json)
        end
    end

    def check_intervention
        if self.status_changed?
            if self.status == 'Intervention'
                account_sid = ENV['ACCOUNT_SID_TWILIO']
                auth_token = ENV['AUTH_TOKEN_TWILIO']
                @client = Twilio::REST::Client.new(account_sid, auth_token)
                column = Column.find(self.column_id)
                battery = Battery.find(column.battery_id)
                building = Building.find(battery.building_id)
                name = building.building_technical_full_name
                to_phone = ENV['PHONE_NUMBER']
                from_phone = ENV['PHONE_NUMBER_TWILIO']

                
                message = @client.messages.create(
                    body: "Hi #{name} the elevator with id #{self.id} and serial_number #{self.serial_number} is in Intervention",
                    from: from_phone,
                    to: to_phone
                )
            end
        end
    end
end
