class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @performance = Performance.find(params[:performance_id])
    @booking = Booking.new(set_params)
    @booking.user = current_user
    @booking.performance = @performance
    if @booking.save

    else
      render :new
    end
  end

  private

  def set_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
