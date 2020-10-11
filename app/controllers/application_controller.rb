class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end

    def full_name
        "#{current_user.first_name} #{current_user.last_name}"
    end

    def after_sign_in_path_for(resource)
    puts resource
      if current_user.role == 'doctor' || current_user.role=='patient'
         # also add specific url = '/suppliers/registrations/user'
        doctors_path
      end
    end
end
