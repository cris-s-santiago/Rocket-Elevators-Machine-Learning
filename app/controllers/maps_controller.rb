class MapsController < ApplicationController
    authorize_resource

    def index
        @buildings = Building.all.to_json
        @addresses = Address.all.to_json
        @buildingInfos = Building_detail.all.to_json
        @batteries = Battery.all.to_json
        @columns = Column.all.to_json
        @elevators = Elevator.all.to_json
        @customers = Customer.all.to_json

    end

end
