class ArticlesController < ApplicationController

  before_filter :authenticate_user!, :except => [:show, :index]

  def index
    @articles = Article.all
  end

  def new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.valid?
      @article.save
      redirect_to @article #автоматически перенаправляет на страницу /articles/id, где id - id-шник свежесозданной статьи. вьюха create в данном случае больше не нужна.
    else
      render action: 'new'
    end

  end

  def edit
    @article = Article.find(params[:id]) 
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article #автоматически перенаправляет на страницу /articles/id, где id - id-шник свежесозданной статьи. вьюха create в данном случае больше не нужна.
    else
      render action: 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end


  private #все методы ниже будут недоступны извне, только из методов этого контроллера

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
