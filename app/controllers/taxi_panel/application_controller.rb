module TaxiPanel

  class ApplicationController < ActionController::Base
    before_filter :authenticate_taxi!
    prepend_view_path "app/views/taxi_panel"
    layout "application"

  end

end