class ProfessorsController < ApplicationController
  include ProfessorsHelper

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

    # TODO: Work on shortcut for editing/deleting classes from professor show/edit page?

    @classes = get_classes_by_professor( @professor )
  end

  def edit
    @professor = Professor.find(params[:id])
    
    @classes = get_classes_by_professor( @professor )
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