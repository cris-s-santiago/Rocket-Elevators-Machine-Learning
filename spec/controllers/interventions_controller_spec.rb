require 'rails_helper'
require_relative "../support/devise"
# require 'cancan/matchers'

RSpec.describe InterventionsController, :type => :controller do

    describe "Test Interventions Dashboard access" do
        context "from user with no privilege" do   
            login_user   
            it "should return 302" do
                get :index
                # puts "302 means the user wasn't allowed and is being redirected"
                expect(response).to have_http_status(302)
            end
        end
        context "from admin with access" do   
            login_admin   
            it "should return 200:OK" do
                get :index
                expect(response).to have_http_status(:success)
            end
        end
    end

    context 'Create a new intervention, Should expect "true"' do
        it 'it works!' do
            newIntervention = Intervention.new(
                author: 1,
                customer_id: 1,
                building_id: 1,
                battery_id: 1,
                column_id: 1,
                elevator_id: 1,
                employee_id: 1
            ).save
            expect(newIntervention).to eq(true)
        end
    end

end