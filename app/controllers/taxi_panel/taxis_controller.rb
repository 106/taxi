module TaxiPanel
  class TaxisController < TaxiPanelApplicationController
    before_filter :authenticate_taxi!, only: [:edit, :update]
    before_filter :use_only_your_profile, only: [:edit, :update]
    before_action :set_taxi, only: [:show, :edit, :update]

    def show
      month_start = Time.now.beginning_of_month
      month_end = Time.now.end_of_month
      @orders_for_current_month = Order.where(taxi_id: @taxi.id).where(created_at: month_start..month_end)
    end

    def edit
    end

    def update
      if @taxi.update(taxi_params)
        redirect_to @taxi, notice: 'Taxi was successfully updated.'
      else
        render action: 'edit'
      end
    end

    private
      def set_taxi
        @taxi = Taxi.find(params[:id])
      end

      def taxi_params
        params.require(:taxi).permit(:name, :phone, :website, :default_price, :price_for_km, :city, :min_distance, :check, :animals, :air_conditioning, :vip, :minivan, :out_of_town, :check_price, :animals_price, :air_conditioning_price, :vip_price, :minivan_price, :out_of_town_price)
      end

      def use_only_your_profile
        redirect_to root_path if current_taxi.id != params[:id].to_i
      end
  end
end
