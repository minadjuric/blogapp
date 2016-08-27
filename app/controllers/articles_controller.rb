class ArticlesController < ApplicationController
  def index
  	@articles = Article.all
  end

  def edit
  	@article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    respond_to do |format|
      format.html { redirect_to @article, notice: 'Article was successfully updated.' }
    end
  end

  def new
  	@article = Article.new
  end

  def show
  	@article = Article.find(params[:id])
  end

  def create
   	@article = Article.new(article_params)
    if @article.save
  	 redirect_to @article
    else
      render 'new'
    end
  end

  def destroy
  	@article = Article.find(params[:id])
  	@article.destroy
  	respond_to do |format|
    	format.html { redirect_to articles_path, notice: 'Article was successfully destroyed.' }
    end
  end

  def article_params
  	params.require(:article).permit(:title, :body)
  end

end
