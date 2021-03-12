class ApplicationController < ActionController::Base
     before_action :configure_permitted_parameters, if: :devise_controller?
    
    def after_sign_in_path_for(resource)
        case resource
            when Admin
              admin_top_path          
            when Customer
              root_path              
        end
    end
        
        def after_sign_out_path_for(resource)
            admin_session_path
        end

     protected
    def configure_permitted_parameters
        if resource_class == Customer
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
            devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
            devise_parameter_sanitizer.permit(:account_update,keys:[:name,:email])
        elseif resource_class == Admin
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
            devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
            devise_parameter_sanitizer.permit(:account_update,keys:[:name,:email])
        end
    end
end
