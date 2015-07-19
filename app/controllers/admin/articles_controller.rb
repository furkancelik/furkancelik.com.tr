class Admin::ArticlesController < Admin::ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit!)
    if @article.save
      flash[:notice] = "Başarıyla Kayıt Edildi"
      redirect_to admin_articles_url
    else
      render :new
    end
  end

  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit!)
      flash[:notice] = "Kayıt Güncellendi"
      redirect_to admin_articles_url
    else
      render :edit
    end
  end

  def destroy
    if Article.destroy(params[:id])
      redirect_to admin_articles_url, notice:"Başarıyla Silindi"
    else
      redirect_to admin_articles_url, error:"Bir Hata Meydana Geldi ve Silinemedi"
    end
  end
end
