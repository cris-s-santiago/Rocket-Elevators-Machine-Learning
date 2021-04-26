class RolesController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource

    def new
    end

    def create
    end

end
