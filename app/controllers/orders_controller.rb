class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
    @taxis = Taxi.where(:city => @order.places.first.city) if @order.calculated?
    @route = @order.route
  end

  def new
    @order = Order.create
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order
    else
      render action: 'new'
    end
  end

  def update
    if @order.update(order_params)
      create_it if @order.calculated?
      calculate_params if @order.pending?
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render action: 'new'
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url
  end

  private

    def calculate_params
      @order.update_attributes distance: @order.by_count ? 0 : (@order.get_distance/1000.0).round(2)
      @order.params_calculated
    end

    def create_it
      @order.taxi_was_choosen
    end

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:animals, :air_conditioning, :vip, :minivan, :out_of_town, :taxi_id, :user_id, :state, :cost, :driver_id, :user_phone, :comment, :by_count, :check)
    end
end
