class BookingsController < ApplicationController
  before_action :set_booking, except: [:create, :confirmation]

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @space = Space.find(params[:space_id])
    @booking.space = @space
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :confirmation
    end
  end

  def update
    @booking.update(booking_params)
  end

  def destroy
    @booking.destroy
  end

  def confirmation
    @booking = Booking.new(booking_params)
    @space = Space.find(params[:space_id])
  end

  def edit
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:time, :date, :user_id, :space_id)
  end
end
