
class ArticlesController < ApplicationController

  # Initial Root Function
  def index
    @article = Article.all
  end

  # Function to show single article and its content 
  def show
    @article = Article.find(params[:id]) 
  end  

  # Function to build new article
  def new 
    @article = Article.new
  end  

  # Function to create new article
  def create 
    @article = Article.new(article_params)
    
    if @article.save 
      redirect_to @article
    else 
      render :new, status: :unprocessable_entity
    end
  end

  # Function to edit existing article
  def edit 
    @article = Article.find(params[:id])
  end  

  # Function to update existing article
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params) 
      redirect_to @article
    else 
      render :edit, status: :unprocessable_entity 
    end   
  end  
  
  # Function to delete article
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end  
  
  private
  def article_params
    params.require(:article).permit(:title, :imagePath, :body)
  end  
end
