class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new( subject_params )

    if @subject.save
      redirect_to @subject
    else
      render 'new'
    end
  end

  def show
    @subject = Subject.find( params[:id] )
    
    # TODO: Work on shortcut for editing/deleting classes from subject show/edit page?
    # TODO: Try not to use raw fragments of SQL queries?
    @classes = Classis
      .select( "classes.id, professors.name, professors.id as 'professor_id'" )
      .where( "subject_id = ?", @subject.id )
      .joins( :professor )
  end

  def edit
    @subject = Subject.find( params[:id] )
  end

  def update
    @subject = Subject.find( params[:id] )

    if @subject.update( subject_params )
      redirect_to @subject
    else
      render 'edit'
    end
  end

  def destroy
    @subject = Subject.find( params[:id] )
    @subject.destroy

    redirect_to subjects_path
  end

  private def subject_params
    params.require( :subject ).permit( :title, :description )
  end
end