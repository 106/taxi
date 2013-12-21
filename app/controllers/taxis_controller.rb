class TaxisController < ApplicationController
  before_filter :authenticate_taxi!, only: [:edit, :update, :destroy]
  before_filter :use_only_your_profile, only: [:edit, :update, :destroy]
  before_action :set_taxi, only: [:show, :edit, :update, :destroy]

  def index
    @taxis = Taxi.all
  end

  def show
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

  def destroy
    @taxi.destroy
    redirect_to taxis_url
  end

  private
    def set_taxi
      @taxi = Taxi.find(params[:id])
    end

    def taxi_params
      params.require(:taxi).permit(:name, :phone, :website, :default_price, :price_for_km, :rank, :description, :city, :min_distance)
    end

    def use_only_your_profile
      redirect_to root_path if current_taxi.id != params[:id].to_i
    end
end
