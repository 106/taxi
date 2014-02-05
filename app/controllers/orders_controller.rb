class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
    if @order.calculated?
      @taxis = Taxi.where(:city => @order.places.first.city.name).select {|taxi| (taxi.additional & @order.additional).size == @order.additional.size }
    end
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
    if @order.update_attributes(order_params)
      create_it if @order.calculated?
      calculate_params if @order.pending?
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render action: 'new' if @order.pending?
      redirect_to @order, alert: @order.errors.full_messages.join(". ") if @order.calculated?
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url
  end

  private

    def calculate_params
      @order.params_calculated
    end

    def create_it
      @order.update_attributes cost: @order.taxi.cost_for_distance(@order.human_distance)#, distance: ''
      @order.taxi_was_choosen
    end

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:animals, :distance, :air_conditioning, :vip, :minivan, :out_of_town, :taxi_id, :user_id, :state, :driver_id, :user_phone, :comment, :by_count, :check)
    end
end
