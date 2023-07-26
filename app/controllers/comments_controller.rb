class CommentsController < ApplicationController
    
    # create new comment
    def create 
      @article = Article.find(params[:article_id])
      begin
        @commment = @article.comments.create!(comment_params)
        redirect_to article_path(@article)
      rescue => exception
        # redirect_to new_article_comment_path(params[:article_id])
        redirect_to article_path(@article)
      end 
    end    
    
    # delete comment
    def destroy 
      
        @comment = Comment.find(params[:id] && params[:article_id])
        @comment.destroy

        redirect_to article_path
    end 
    
    # build reply to comment
    def new 
        @article = Article.find(params[:article_id])
        @comment = @article.comments.new(parent_id: params[:parent_id])

    end    
    
    private
    def comment_params 
       params.require(:comment).permit(:commenter, :body, :article_id, :parent_id)
    end    

end
