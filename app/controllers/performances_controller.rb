class PerformancesController < ApplicationController
 before_action :set_performance, only: [:show]
  def index
    @performances = Performance.all
  end

  def show
  end

  def new
    @performance = Performance.new
  end

  def create
    @performance = Performance.new(set_params)
    @performance.user_id = current_user
    if @performance.save
      redirect_to performance_path(@performance)
    else
      render :new
    end
  end

  private

  def set_params
    params.permit(:performance).require(:speciality, :price, :area, :name)
  end

  def set_performance
     @performance = Performance.find(params[:id])
  end
end
