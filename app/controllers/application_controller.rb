class ApplicationController < ActionController::Base
  before_action :authenticate_user!  # ログインしていないユーザーをログインページの画面に促す
  before_action :configure_permitted_parameters, if: :devise_controller?# before_actionを使用しているために必要

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # deviseでユーザー登録をする場合に使用でき、「特定のカラムを許容する」メソッド
  end
end
