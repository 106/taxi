class StreetsController < ApplicationController

  respond_to :json

  def index
    @streets = Street.where("city_id = #{params[:city_id]} AND name like '%#{params[:term].capitalize}%'").pluck(:name)
    render json: @streets
  end

end
