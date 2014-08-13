class CommentsController < ApplicationController

    http_basic_authenticate_with name: "christy", password: "greygray", only: [:destroy]
    def new
    end

    def create
        @article = Article.find(params[:article_id])
        @user = current_user
        @commnet = @article.comments.create(comment_params)
        @comment.update user_id: @user.id

        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy

        redirect_to article_path(@article)
    end

    private
    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end

end
