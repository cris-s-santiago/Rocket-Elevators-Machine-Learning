FactoryBot.define do
    factory :user do
      sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@sample.com" }
      password { "123456" }
    end
    factory :admin, class: "User" do
      name { 'Test Admin' }
      surname { 'Test Admin' }
      employee_id { 8 }
      email {'abc@abc.com'}
      password { "123456" }
      admin { true }
      role_id { 3 }
    end 
  end