class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_in_path_for(resource)
    case resource
    when Admin
         admins_top_path
    when User
         mytrips_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :user
        root_path
    else
      new_admin_session_path
    end
  end

	protected
	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:age,:gender])

  end
end