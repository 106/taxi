class StreetsController < ApplicationController

  respond_to :json

  def index
    @streets = Street.where(city_id: params[:city_id])
    render json: @streets.select {|s| s.name.mb_chars.downcase.to_s.include? params[:term].mb_chars.downcase.to_s }.map {|s| s.name}
  end

end
