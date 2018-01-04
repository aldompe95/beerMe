class DashboardController < ApplicationController
	def index
		@logs = current_user.beer_logs.group(:beer_id)
		@beer_catalog = Beer.all.as_json
		@beer_log = BeerLog.new
		@beer_catalog = Beer.all
	end

	def autocomplete
		beer_catalog = Beer.where("name like ?", "%#{params[:word]}%")
  	render :json => beer_catalog
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

  def auto_complete

  end

  private

  def beer_log_params
  	params.require(:beer_log).permit(:user_id, :beer_id, :quantity)
  end



end
