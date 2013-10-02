class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for (resource)
  	flash[:notice] = "You have requested admin status on #{Organization.find(session[:organization_id]).name}" unless session[:organization_id].blank?
    return root_url if current_user.admin? || current_user.organization == nil
    organization_path(current_user.organization.id)
  end
end
