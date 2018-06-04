class ProfessorsController < ApplicationController
  def index
    @professors = Professor.all
  end

  def new
    @professor = Professor.new
  end

  def create
    @professor = Professor.new(professor_params)

    if @professor.save
      redirect_to @professor
    else
      render 'new'
    end
  end

  def show
    @professor = Professor.find(params[:id])

    # TODO: Try not to use raw fragments of SQL queries?
    @classes = Classis
      .select( 'subjects.title' )
      .where( "professor_id = ?", @professor.id )
      .joins( :subject )
  end

  def edit
    @subjects = Subject.all
    @professor = Professor.find(params[:id])
  end

  def update
    @professor = Professor.find(params[:id])

    if @professor.update(professor_params)
      redirect_to @professor
    else
      render 'edit'
    end
  end

  def destroy
    @professor = Professor.find(params[:id])
    @professor.destroy

    redirect_to professors_path
  end

  private def professor_params
    params.require(:professor).permit(:name)
  end
end