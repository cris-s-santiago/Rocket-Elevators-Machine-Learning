module ControllerMacros
    def login_admin
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:admin]
        sign_in FactoryBot.create(:admin) # Using factory bot as an example
        # admin = User.new(
        #   email: 'abc@123',
        #   password: '123456',
        #   name: "hey",
        #   role_id: '3'
        # )
        # sign_in admin
      end
    end
    
    def login_user
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        user = User.new
        sign_in user
      end
    end
  end
