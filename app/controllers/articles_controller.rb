class ArticlesController < ApplicationController

  http_basic_authenticate_with name: 'ericliu', password: 'jatgds', except: [:index, :show]

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find params[:id]
  end

  def create
    return unless params[:other][:password] == 'liuxiaoqiericliu'
    @article = Article.new article_params
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find params[:id]
  end

  def delete
    @article = Article.find params[:id]
    @article.destroy
    redirect_to article_path
  end

  def update
    return unless params[:other][:password] == 'liuxiaoqiericliu'
    @article = Article.find params[:id]
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit(:tags, :title, :content)
  end
end
