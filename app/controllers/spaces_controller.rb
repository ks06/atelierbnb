class SpacesController < ApplicationController
  def index
    @spaces = Space.all
  end

  def show
    @space = Space.find(params[:id])
  end

  def new
    @space = Space.new
  end

  def create
    # need to create log in logic
    @space = Space.new(space_params)
    @space.owner = current_user
    if @space.save
      redirect_to space_path(@space)
    else
      render :new
    end
  end

  def edit
    @space = Space.find(params[:id])
  end

  def update
    @space = Space.find(params[:id])
    @space.update(space_params)
  end

  def destroy
    @space = Space.find(params[:id])
    @space.destroy
  end

  private

  def space_params
    params.require(:space).permit(:location, :type, :capacity, :description, :user_id)
  end
end
