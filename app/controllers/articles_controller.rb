class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @id = params[:id]
    @article = Article.find(@id)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to articles_path
  end

  def edit
    @id = params[:id]
    @article = Article.find(@id)
  end

  def update
    @id = params[:id]
    @article = Article.find(@id)
    @article.update(article_params)

    redirect_to article_path(@article)
  end

  def destroy
    @id = params[:id]
    @article = Article.find(@id)
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
