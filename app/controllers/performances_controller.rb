class PerformancesController < ApplicationController
 before_action :set_performance, only: [:show, :edit, :destroy]
 skip_before_action :authenticate_user!, only: [:index, :show]
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
    @performance.user = current_user

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
    redirect_to performances
  end

  private

  def set_params
    params.require(:performance).permit(:speciality, :price, :area, :name)
  end

  def set_performance
     @performance = Performance.find(params[:id])
  end
end
