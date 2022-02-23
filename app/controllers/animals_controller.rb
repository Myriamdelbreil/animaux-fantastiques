class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @animals = policy_scope(Animal).order(created_at: :desc)
  end

  def show
    @animal = Animal.find(params[:id])
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
    redirect_to animals_path
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :category, :price, :description, :photo)
  end
end
