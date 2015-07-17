class Admin::PagesController < Admin::ApplicationController
  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params.require(:page).permit!)
    if @page.save
      flash[:notice] = "Başarıyla Kayıt Edildi"
      redirect_to admin_pages_url
    else
      render :new
    end
  end

  def index
    p @pages = Page.all
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update(params.require(:page).permit!)
      flash[:notice] = "Kayıt Güncellendi"
      redirect_to admin_pages_url
    else
      render :edit
    end
  end

  def destroy
    if Page.destroy(params[:id])
      redirect_to admin_pages_url, notice:"Başarıyla Silindi"
    else
      redirect_to admin_pages_url, error:"Bir Hata Meydana Geldi ve Silinemedi"
    end
  end
end
