require "rails_helper"
RSpec.describe MainController, :type => :controller do
    describe "index" do
        it "renders the index template" do
            get :index
            expect(response).to render_template("index")
            expect(response.body).to eq ""
        end
    end
end