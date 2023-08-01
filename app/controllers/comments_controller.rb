class CommentsController < ApplicationController
    
    # create and save new comment
    def create 
      @article = Article.find(params[:article_id])
      @user = User.find(@article.user_id)
      base_url = "/:id/display"
      iD = @article.id
      user_specific_url = base_url.sub(':id', iD.to_s)
      begin
        @comment = @article.comments.create(comment_params)
        if @comment.save
          redirect_to user_specific_url, notice: "comment was successfully created."
        else  
          redirect_to user_specific_url, alert: "Failed to create the comment."
        end  
      rescue => exception
        # redirect_to new_article_comment_path(params[:article_id])
        redirect_to user_specific_url, alert: "An error occured while creating the comment."
      end 
    end    
    
    # delete existing comment
    def destroy 
      
        @comment = Comment.find(params[:id] && params[:article_id])
        base_url = "/users/:user_id/articles/main"
        iD = params[:user_id]
        user_specific_url = base_url.sub(':user_id', iD.to_s)
        
        if @comment.destroy
          redirect_to user_specific_url, notice: "comment deleted successfully"
        else   
          redirect_to user_specific_url, notice: "comment not deleted"
        end  
    end 
    
    # build reply to comment
    def new 
        @user = User.find(params[:user_id])
        @article = Article.find(params[:article_id])
        @comment = @article.comments.new(parent_id: params[:parent_id])

    end    
    
    private
    def comment_params 
       params.require(:comment).permit(:commenter, :body, :article_id, :parent_id)
    end    

end
