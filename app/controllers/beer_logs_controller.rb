class BeerLogsController < ApplicationController
  before_action :define_beer_log, only: [:edit, :update, :destroy]
  before_action :define_beer_catalog, only: [:new, :edit]

  def new
    @beer_log = BeerLog.new
  end

  def create
    @beer_log = BeerLog.new(beer_log_params)
    if @beer_log.save
      redirect_to root_path, flash: { success: 'Beer log was registered successfully' }
    else
      redirect_to root_path, flash: { danger: @beer_log.errors.to_a }
    end
  end

  def edit
  end

  def update
    if @beer_log.update(beer_log_params)
      redirect_to root_path, flash: { success: 'Beer log was updated successfully' }
    else
      redirect_to root_path, flash: { danger: @beer_log.errors.to_a }
    end
  end

  def destroy
    @beer_log.destroy
    redirect_to root_path
  end

  private

    def beer_log_params
      params.require(:beer_log).permit(:user_id, :beer_id, :quantity, :date)
    end

    def define_beer_log
      @beer_log = BeerLog.find(params[:id])
    end

    def define_beer_catalog
      @beer_catalog ||= Beer.all
    end
end
