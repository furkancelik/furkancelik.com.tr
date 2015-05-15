module Admin
  class ApplicationController < ActionController::Base
    layout '/admin/layouts/application.html.haml'
    protect_from_forgery with: :exception
    helper_method :signed_in, :current_user
    before_action :is_login, except: [:login, :login_post, :logout]
    before_action :login_redirect, only: [:login]

    private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def signed_in?
      current_user
    end

    def is_login
      unless signed_in?
        flash[:error] = "Sayfaya Erişebilmek İçin Giriş Yapmalısınız!"
        redirect_to  admin_login_path
      end
    end

    def login_redirect
      if signed_in?
        redirect_to admin_index_path
      end
    end


  end
end