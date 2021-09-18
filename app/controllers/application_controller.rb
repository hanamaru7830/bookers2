class ApplicationController < ActionController::Base
  #前に :アクションを実行 :デバイスの機能利用
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
