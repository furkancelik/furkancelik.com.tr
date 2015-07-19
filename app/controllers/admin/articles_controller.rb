class Admin::ArticlesController < Admin::ApplicationController
  before_action :categories, only:[:new,:edit]

  def new
    @article = Article.new
  end


  def create
    @article = Article.new(article_params)
    category_params.each do |id|
      @article.category << Category.find(id)
    end
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
    @article.category.delete_all
    if @article.update(article_params)
      category_params.each do |id|
        @article.category << Category.find(id)
      end
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

  private
  def categories
    p @categorys = Category.all
  end

  def article_params
    params.require(:article).except(:category).permit!
  end

  def category_params
    _param = params.require(:article).permit!
    _param[:category].delete("")
    _param[:category]
  end
end
