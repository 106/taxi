class TaxisController < ApplicationController
  before_action :set_taxi, only: [:show, :edit, :update, :destroy]

  def index
    @taxis = Taxi.all
  end

  def show
  end

  def new
    @taxi = Taxi.new
  end

  def edit
  end

  def create
    @taxi = Taxi.new(taxi_params)
    if @taxi.save
      redirect_to @taxi, notice: 'Taxi was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @taxi.update(taxi_params)
      format.html { redirect_to @taxi, notice: 'Taxi was successfully updated.' }
    else
      format.html { render action: 'edit' }
    end
  end

  def destroy
    @taxi.destroy
    respond_to do |format|
      format.html { redirect_to taxis_url }
      format.json { head :no_content }
    end
  end

  private
    def set_taxi
      @taxi = Taxi.find(params[:id])
    end

    def taxi_params
      params.require(:taxi).permit(:name, :phone, :website, :default_price, :price_for_km, :rank, :description, :city)
    end
end
