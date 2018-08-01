class CommentsController < ApplicationController
  def create
    @post = Post.friendly.find(params[:post_id])

    if @post.comments.create(comment_params)
      redirect_to @post,
                  notice: 'Comment was successfully created.'
    else
      redirect_to @post,
                  alert: 'Error creating comment, ' + @post.errors
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.friendly.find(params[:post_id])

    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :content)
  end
end
