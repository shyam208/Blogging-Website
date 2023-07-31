# Controller to control the flow regarding Articles

class ArticlesController < ApplicationController

  # display articles of all users
  def index
    @article = Article.all
  end

  # User Login Page showing his articles and blog 
  def main  
    @user = User.find(params[:user_id])
    @articles = @user.articles
  end

  # Function to show single article and its content 
  def show
    @article = Article.find(params[:id]) 
    @user = User.find(@article.user_id)
  end  

  # display common articles individually
  def display 
     @article = Article.find(params[:id])
  end

  # Function to build new article
  def new 
    @user = User.find(params[:user_id])
  end  

  # Function to create new article
  def create 
    @user = User.find(params[:user_id])

    begin
    @article = @user.articles.create!(article_params)
    base_url = "/users/:user_id/articles/main"
    iD = params[:user_id]
    user_specific_url = base_url.sub(':user_id', iD.to_s)
    redirect_to user_specific_url
    rescue => exception
      render :new, status: :unprocessable_entity
    end

  end

  # Function to edit existing article
  def edit 
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])
  end  

  # Function to update existing article
  def update
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])

    if @article.update!(article_params) 
      base_url = "/users/:user_id/articles/main"
      iD = params[:user_id]
      user_specific_url = base_url.sub(':user_id', iD.to_s)
      redirect_to user_specific_url, status: :see_other
    else 
      render :edit, status: :unprocessable_entity 
    end   
  end  
  
  # Function to delete article
  def destroy
    @article = Article.find(params[:id])
    @user = User.find(@article.user_id)
    base_url = "/users/:user_id/articles/main"
    iD = params[:user_id]
    user_specific_url = base_url.sub(':user_id', iD.to_s) 
    @article.destroy
    redirect_to user_specific_url
  end  
  
  private
  def article_params
    params.require(:article).permit(:title, :imagePath, :body)
  end  
end
