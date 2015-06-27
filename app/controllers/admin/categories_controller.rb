class Admin::CategoriesController < Admin::ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params.require(:category).permit!)
    if @category.save
      flash[:notice] = "Başarıyla Kayıt Edildi"
      redirect_to admin_categories_url
    else
      render :new
    end
  end

  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(params.require(:category).permit!)
      flash[:notice] = "Kayıt Güncellendi"
      redirect_to admin_categories_url
    else
      render :edit
    end
  end

  def destroy
    begin
      Category.destroy(params[:id])
      redirect_to admin_categories_url , notice:"Başarıyla Silindi"
    rescue ActiveRecord::RecordNotFound => _
      redirect_to admin_categories_url, error:"Bir Hata Meydana Geldi ve Kayıt Silinemedi"
    end
  end

end
