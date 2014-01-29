module TaxiPanel

	class BookedOrdersController < TaxiPanelApplicationController

    respond_to :js, :html

    before_action :set_booked_order, only: [:update]

    def index
      @booked_orders = current_taxi.orders.where state: 'created'
    end

    def update
      driver = Driver.find_by_number(params[:driver_name])
      if @booked_order.update_attributes driver_id: driver.try(:id)
        @booked_order.driver_was_choosen if @booked_order.created? && @booked_order.driver_id.present?
      end
      redirect_to booked_orders_path
    end

    def old_orders
      @booked_orders = current_taxi.orders.reject {|o| o.created?}
    end

    private

    def set_booked_order
      @booked_order = Order.find(params[:id])
    end

    def booked_order_params
      params.require(:order).permit(:driver_name)
    end

  end
end
