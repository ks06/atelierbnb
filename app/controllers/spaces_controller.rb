class SpacesController < ApplicationController
  before_action :set_space, except: [:index, :new, :create]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:search]
      if params[:search].empty?
      # @spaces = Space.where("category ILIKE ?", "%" + params[:search][:text] + "%")
        @spaces = Space.all
      else
        @spaces = Space.search_errthang(params[:search])
      end
    else
      @spaces = Space.all
    end
  end

  def show
    @booking = Booking.new
    @booking.space = @space
    @marker = [{ lat: @space.latitude, lng: @space.longitude }]
  end

  def new
    @space = Space.new
  end

  def create
    # need to create log in logic

    @space = Space.new(space_params)
    @space.owner = current_user
    if @space.save!
      redirect_to space_path(@space)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @space.update(space_params)
    redirect_to @space
  end

  def destroy
    @space.destroy
    redirect_to spaces_path
  end

  private

  def set_space
    @space = Space.find(params[:id])
  end

  def space_params
    params.require(:space).permit(:location, :category, :capacity, :description, :user_id, :title, photos: [])
  end

  def search_params
    params.require(:search).permit(:search)
  end

end
