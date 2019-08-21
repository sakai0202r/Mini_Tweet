class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  # ログイン済みユーザーかどうか確認
  def logged_in_user
    unless logged_in?
      store_location
      flash[:notice] = "ログインして下さい"
      redirect_to login_url
    end
  end

  def set_locale
    I18n.locale = @current_user&.locale || :ja
  end
end
