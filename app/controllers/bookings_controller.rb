class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]

  def show
    @performance = @booking.performance
  end

  def new
    @performance = Performance.find(params[:performance_id])
    @booking = Booking.new
  end

  def create
    @performance = Performance.find(params[:performance_id])
    @booking = Booking.new(set_params)
    @booking.user = current_user
    @booking.performance = @performance
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
