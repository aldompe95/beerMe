class BeerLogsController < ApplicationController

  def new
    @beer_log = BeerLog.new
    @beer_catalog = Beer.all
  end

  def create
    @beer_log = BeerLog.new(beer_log_params)
    if @beer_log.save
      redirect_to root_path, :flash => { :success => "Beer log was registered successfully" }
    else
      flash[:danger] = @beer_log.errors.to_a
      redirect_to root_path
    end
  end

  def edit
    @beer_log = BeerLog.find(params[:id])
    @beer_catalog = Beer.all
  end

  def update
    @beer_log = BeerLog.find(params[:id])
    if @beer_log.update(beer_log_params)
      redirect_to root_path, :flash => { :success => "Beer log was updated successfully" }
    else
      flash[:danger] = @beer_log.errors.to_a
      redirect_to edit_profile_path
    end
  end

  def destroy
    @beer_log = BeerLog.find(params[:id])
    @beer_log.destroy
    redirect_to root_path
  end

  private
    def beer_log_params
      params.require(:beer_log).permit(:user_id, :beer_id, :quantity, :date)
    end
end
