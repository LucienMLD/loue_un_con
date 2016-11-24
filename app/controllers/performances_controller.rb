class PerformancesController < ApplicationController
  before_action :set_performance, only: [:show, :edit, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @performances = Performance.where.not(latitude: nil, longitude: nil)

    @marker = Gmaps4rails.build_markers(@performances) do |performance, marker|
      marker.lat performance.latitude
      marker.lng performance.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
    @marker = Gmaps4rails.build_markers(@performance) do |performance, marker|
      marker.lat performance.latitude
      marker.lng performance.longitude
    end
  end

  def new
    @performance = Performance.new
  end

  def create
    @performance = Performance.new(set_params)
    @performance.user = current_user
    @performance.address = current_user.address

    if @performance.save
      redirect_to performance_path(@performance)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @performance = Performance.update(set_params)
    redirect_to performance_path(@performance)
  end

  def destroy
    @performance.destroy
    redirect_to performances_path
  end

  private

  def set_params
    params.require(:performance).permit(:speciality, :price, :area, :name, :photo)
  end

  def set_performance
    @performance = Performance.find(params[:id])
  end
end
