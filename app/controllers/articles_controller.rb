class ArticlesController < ApplicationController
  #before_action :sign_in_user, only: [:edit, :destroy, :new, :create]
  #before_action :correct_user, only: [:edit, :destroy]
  #http_basic_authenticate_with name: "christy", password: "greygray", except: [:index, :show]

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.create(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

    def sign_in_user
      redirect_to signin_url, notice: "Pleace sign in" unless signed_in?
    end

    def correct_user
      @article = Article.find(params[:id])
      @user = User.find(@article.user_id)
      redirect_to root_path unless correct_user?(@user)
    end
end
