class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.animal = animal(params[:id])
    if @booking.save
      redirect_to booking_path()
    else
      render :new
    end
  end

  # test

  private

  def booking_params
    params.require(:booking).permit(:total_price, :start_date, :end_date, :user_id, :animal_id)
  end

end
