class CommentsController < ApplicationController
 before_action :authenticate_user!, except: [ :index, :show ]

  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

   def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

   def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    if @comment.update(comments_params)
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
 
  private

    def comment_params
      params.require(:comment).permit(:name, :description)
    end
end
