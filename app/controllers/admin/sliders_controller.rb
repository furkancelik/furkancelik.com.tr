class Admin::SlidersController < Admin::ApplicationController

  def index
    @slider = Slider.find(1)
  end

  def update
    @slider = Slider.find(params[:id])
    if @slider.update(params.require(:slider).permit!)
      flash[:notice] = "Slider Güncellendi"
      redirect_to admin_sliders_url
    else
      render :index
    end
  end

end
