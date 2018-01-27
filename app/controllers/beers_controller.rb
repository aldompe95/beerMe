class BeersController < ApplicationController
  before_action :define_beer, only: [:edit, :update, :destroy]

  def index
    @beers = Beer.all
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.new(beer_params)
    if @beer.save
      redirect_to beers_path, flash: { success: 'Beer log was registered successfully' }
    else
      redirect_to beers_path, flash: { danger: @beer.errors.to_a }
    end
  end

  def edit
  end

  def update
    if @beer.update(beer)
      redirect_to beers_path, flash: { success: 'Beer log was updated successfully' }
    else
      redirect_to beers_path, flash: { danger: @beer.errors.to_a }
    end
  end

  def destroy
    @beer.destroy
    redirect_to beers_path
  end

  private
    def beer_params
      params.require(:beer).permit(:name, :image)
    end

    def define_beer
      @beer = Beer.find(params[:id])
    end
end
