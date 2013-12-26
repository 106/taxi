module TaxiPanel

	class DriversController < TaxiPanelApplicationController

    respond_to :js

    def index
      @orders = current_taxi.orders
    end

    def show
    	@order = Order.find params[:id]
    end

  end
end
