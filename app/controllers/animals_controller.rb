class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query_category].present?
      if params[:query_price].present?
        animals = policy_scope(Animal).order(created_at: :desc)
                                      .search_by_category(params[:query_category])
        @animals = animals.select { |animal| animal.price <= params[:query_price].to_i}
      else
        @animals = policy_scope(Animal).order(created_at: :desc)
                                       .search_by_category(params[:query_category])
      end
    elsif params[:query_price].present? && params[:query_category].present? == false
      animals = policy_scope(Animal).order(created_at: :desc)
                                    .search_by_price(params[:query_price])
      @animals = animals.select { |animal| animal.price <= params[:query_price].to_i}
    else
      @animals = policy_scope(Animal).order(created_at: :desc)

    if params[:category]
      @animals = @animals.where(category: params[:category])
    end

    @markers = User.where(animals: @animals).geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: user })
      }

    end

  def show
    @animal = Animal.find(params[:id])
    @booking = Booking.new
    authorize @animal
  end

  def new
    @animal = Animal.new
    authorize @animal
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
    authorize @animal
    if @animal.save
      redirect_to animal_path(@animal)
    else
      render :new
    end
  end

  def edit
    @animal = Animal.find(params[:id])
    authorize @animal
  end

  def update
    @animal = Animal.find(params[:id])
    @animal.update(animal_params)
    authorize @animal
    redirect_to animal_path(@animal)
  end

  def destroy
    @animal = Animal.find(params[:id])
    authorize @animal
    @animal.destroy
    redirect_to bookings_path
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :category, :price, :description, photos: [])
  end
end
