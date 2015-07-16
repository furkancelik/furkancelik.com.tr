class Admin::SettingsController < Admin::ApplicationController

  def index
    @setting = Setting.find(1);
  end

  def update
    p "----------------"
    @setting = Setting.find(params[:id])
    if @setting.update(params.require(:setting).permit!)
      flash[:notice] = "Ayarlar Güncellendi"
      redirect_to admin_settings_url
    else
      render :index
    end
  end

end
