class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).where(user: current_user).order(created_at: :desc)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @animal = Animal.find(params[:animal_id])
    @booking.user = current_user
    authorize @booking
    @booking.animal = @animal
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:total_price, :start_date, :end_date, :user_id, :animal_id)
  end

end
