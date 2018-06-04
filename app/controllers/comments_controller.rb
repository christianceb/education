class CommentsController < ApplicationController
  def create
    @classis = Classis.find( params[:classis_id] )
    @comment = @classis.comments.create( comment_params )
    redirect_to classis_path( @classis )
  end

  def destroy
    @classis = Classis.find( params[:classis_id] )
    @comment = @classis.comments.find( params[:id] )
    @comment.destroy
    redirect_to classis_path( @classis )
  end

  private
    def comment_params
      params.require( :comment ).permit( :commenter, :body, :rating )
    end
end