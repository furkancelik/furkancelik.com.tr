module Admin
  class IndexController < Admin::ApplicationController

    def index
    end



    def login
      render "admin/layouts/login.html.haml", layout: false
    end

    def login_post
      user = User.find_by(auth:"1",username:params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        session[:username]  = user.username
        redirect_to admin_index_path
      else
        flash.now[:error] = "Kullanıcı Adı Yada Parola Hatalı!"
        render "admin/layouts/login.html.haml", layout: false
      end
    end

    def logout
      session.delete(:user_id)
      session.delete(:username)
      redirect_to "/"
    end

  end
end