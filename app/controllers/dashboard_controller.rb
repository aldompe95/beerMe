class DashboardController < ApplicationController
  
  def index
    @logs = current_user.beer_logs.where(date: Time.now.beginning_of_week(start_day = :monday)..Date.today)
    @beer_catalog = Beer.all.as_json
    @beer_log = BeerLog.new
    @beer_catalog = Beer.all
  end

  def create
    @beer_log = BeerLog.new(beer_log_params)
    if @beer_log.save
      redirect_to root_path, :flash => { :success => "beer was registered successfully" }
    else
      flash[:danger] = @beer_log.errors.to_a
      redirect_to root_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def autocomplete
    beer_catalog = Beer.where("name like ?", "%#{params[:word]}%")
    render :json => beer_catalog
  end

  private

  def beer_log_params
    params.require(:beer_log).permit(:user_id, :beer_id, :quantity, :date)
  end
end
