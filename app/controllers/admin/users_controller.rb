class Admin::UsersController < Admin::ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit!)
    if @user.save
      flash[:notice] = "Başarıyla Kayıt Edildi"
      redirect_to admin_users_url
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit!)
      flash[:notice] = "Kayıt Güncellendi"
      redirect_to admin_users_url
    else
      render :edit
    end
  end

  def destroy
    begin
      User.destroy(params[:id])
      redirect_to admin_users_url , notice:"Başarıyla Silindi"
    rescue ActiveRecord::RecordNotFound => _
      redirect_to admin_users_url, error:"Bir Hata Meydana Geldi ve Kayıt Silinemedi"
    end
  end

end
