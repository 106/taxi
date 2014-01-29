module TaxiPanel

	class DriversController < TaxiPanelApplicationController

    before_action :set_driver, only: [:show, :edit, :update, :destroy]

	  def index
	    @drivers = current_taxi.drivers
	  end

	  def new
	    @driver = Driver.new
	  end

	  def edit
	  end

	  def create
	    @driver = Driver.new(driver_params)
	    if @driver.save
	      redirect_to drivers_path
	    else
	      render action: 'new'
	    end
	  end

	  def update
	    if @driver.update(driver_params)
	      redirect_to drivers_path, notice: I18n.t('driver.were_updated')
	    else
	      render action: 'edit'
	    end
	  end

	  def destroy
	    @driver.destroy
	    redirect_to drivers_url
	  end

	  private
	    def set_driver
	      @driver = Driver.find(params[:id])
	    end

	    def driver_params
	      params.require(:driver).permit(:number, :car, :car_naumber, :taxi_id)
	    end

  end
end
