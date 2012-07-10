class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # http://railscasts.com/episodes/138-i18n-revised
  before_filter :set_locale
  
  private
  
  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
    
    (I18n.locale = "es" if current_user.username == "homero") if user_signed_in?
    (I18n.locale = "es" if current_user.username == "leonels") if user_signed_in?
    
    # current_user.locale
    # request.subdomain
    # request.env["HTTP_ACCEPT_LANGUAGE"]
    # request.remote_ip
  end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end

end
