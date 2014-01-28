class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  respond_to :js, :html

  def index
    @places = Place.all
  end

  def show
  end

  def new
    @place = Place.new
  end

  def edit
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      @place
    else
      @place.errors
    end
  end

  def update
    if @place.update(place_params)
    else
      render action: 'edit'
    end
  end

  def destroy
    @order = @place.order
    @place.destroy
  end

  private
    def set_place
      @place = Place.find(params[:id])
    end

    def place_params
      params.require(:place).permit(:city_id, :address, :order_id, :porch, :uniq_id)
    end
end
