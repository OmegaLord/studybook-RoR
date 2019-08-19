class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.all
  end

  def show; end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to @route
    else
      render :new
    end
  end

  def edit; end

  def update
    if @route.update(route_params)
      redirect_to @route
    else
      render :edit
    end
    set_station_position(route_params[:railway_station_ids])
  end

  def destroy
    @route.destroy
    redirect_to routes_path
  end

  private

  def route_params
    params.require(:route).permit(railway_station_ids: [])
  end

  def set_route
    @route = Route.find(params[:id])
  end

  def set_station_position(stations)
    # stations_in_table = 
    # binding.pry
    @route.railway_stations_routes.map.with_index { |s, i|
      # binding.pry
      s.position = stations.find(s.railway_station_id)
    }
    stations_in_table.each(&:save)
  end
end
