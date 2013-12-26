module TaxiPanel

	class BookedOrdersController < TaxiPanelApplicationController

    respond_to :js, :html

    before_action :set_booked_order, only: [:show, :edit, :update, :destroy]

    def index
      @booked_orders = current_taxi.orders
    end

    def show
    end

    def update
    	binding.pry
    	if @booked_order.update_attributes booked_order_params   		
    	  @booked_order.driver_was_choosen if @booked_order.created? && @booked_order.driver_id.present?
    	end
    end

    private

    def set_booked_order
      @booked_order = Order.find(params[:id])
    end

    def booked_order_params
      params.require(:order).permit(:taxi_id, :user_id, :state, :cost, :driver_id, :user_phone, :comment)
    end

  end
end
