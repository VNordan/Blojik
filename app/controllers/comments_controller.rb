class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @article.comments.create(comment_params)

    redirect_to article_path(@article)
  end

  def show
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @article #автоматически перенаправляет на страницу /articles/id, где id - id-шник свежесозданной статьи. вьюха create в данном случае больше не нужна.
    else
      render action: 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @article.comments.destroy(params[:id])
    # @article.destroy
    redirect_to article_path(@article)
  end

  private #все методы ниже будут недоступны извне, только из методов этого контроллера

  def comment_params
    params.require(:comment).permit(:author, :body)
  end

end
