class ClassesController < ApplicationController
  include CommentsHelper
  
  def show
    @classis = Classis.find( params[:id] )

    # TODO: surely you could just unify these two into a stdObject or something. Then access it like
    # @rating.average @rating.literal. Not sure if that works.
    @average_rating = @classis.comments.average( :rating )

    if @average_rating.present?
      @literal_rating = literal_rating( @average_rating )
    end
  end

  def new
    @professors = Professor.all
    @subjects = Subject.all

    @classis = Classis.new
  end

  def create
    @classis = Classis.new( classis_params )

    if @classis.save
      redirect_to @classis.subject
    else
      render 'new'
    end
  end

  def destroy
    @classis = Classis.find( params[:id] );
    @subject = @classis.subject
    @classis.destroy

    redirect_to @subject
  end

  private def classis_params
    # TODO: there might be a better parameter to feed here other than explicitly mentioning a column
    # It's ugly here already. It's also ugly in the frontend @_@
    params.require( :classis ).permit( :professor_id, :subject_id )
  end
end