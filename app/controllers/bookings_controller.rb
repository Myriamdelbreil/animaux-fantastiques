class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:edit, :update, :delete]

  def index
    @bookings = policy_scope(Booking).where(user: current_user).order(created_at: :desc)
    @bookings.each do |booking|
      @duration = (booking.end_date - booking.start_date).to_i
      booking.total_price = booking.animal.price * @duration
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
    @duration = (@booking.end_date - @booking.start_date).to_i + 1
    @booking.total_price = @booking.animal.price * @duration
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

  def edit
    @booking = Booking.find(params[:id])
    @user = current_user
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    @user = current_user
    authorize @booking
    if @booking.user == @user
      redirect_to booking_path(@booking)
    else
      redirect_to animal_path(@booking.animal)
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    @user = current_user
    authorize @booking
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:total_price, :start_date, :end_date, :user_id, :animal_id, :status)
  end
end
