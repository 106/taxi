class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.create
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @order.update(order_params)
      calculate_params if @order.pending?
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url
  end

  private

    def calculate_params
      @order.get_distance            
    end

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:taxi_id, :user_id, :state, :driver_id, :user_phone)
    end
end
