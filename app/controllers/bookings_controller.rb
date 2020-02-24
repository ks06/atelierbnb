class BookingsController < ApplicationController
  def show
  end

  def create
    @booking = Booking.new(booking_params)
    redirect_to confirmation_booking_path(@booking)
    if @booking.save

    else
      render :
  end

  def update
  end

  def destroy
  end

  def confirmation

  end
end
