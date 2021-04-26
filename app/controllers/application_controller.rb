class ApplicationController < ActionController::Base
    skip_forgery_protection
    before_action :update_allowed_parameters, if: :devise_controller?

    rescue_from CanCan::AccessDenied do
      flash[:error] = 'Access denied!'
      redirect_to root_url
    end

    protected

    def update_allowed_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :email, :password)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :email, :password, :current_password)}
    end
end
