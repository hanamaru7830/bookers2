class ApplicationController < ActionController::Base

  #前に :アクションを実行 :デバイスの機能利用
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_inactive_sign_up_path_for(resource) #新規登録
    flash[:notice] = "successfully"
    user_path(@user)                
  end

  def after_sign_in_path_for(resource) #ログイン
    flash[:notice] = "successfully"
    user_path(@user) #ログイン後ログインユーザーのshowページ
  end
  
  def after_sign_out_path_for(resource) #ログアウト
    flash[:notice] = "Signed out successfully"
    root_path
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
