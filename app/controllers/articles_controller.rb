class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_article, only: [:show, :edit, :destroy, :update]
  authorize_resource

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.create(article_params)
    if(@article.save)
      redirect_to @article, notice: "Article created Succesfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article,  notice: "Article Updated Succesfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  private
  def set_article
    @article = Article.friendly.find(params[:id], allow_nil: true)
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
