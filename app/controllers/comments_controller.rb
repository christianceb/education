class CommentsController < ApplicationController
  def create
    @classis = Classis.find( params[:classis_id] )
    @comment = @classis.comments.new( comment_params )

    if @comment.save
      redirect_to classis_path( @classis )
    else
      # TODO: There might be a "Rails way" to pass the errors. Notice that on subjects which is 
      # likely using the "Rails way" on handling error messages, if the form fails validation,
      # the fields even remember what they input last. This one doesn't.
      flash[:notice] = @comment.errors.full_messages
      redirect_to classis_path( @classis )
    end
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