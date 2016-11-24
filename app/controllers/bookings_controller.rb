class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

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
    @booking.end_date = @booking.start_date + (@booking.duration * 60 * 60)
    @booking.price = @performance.price * @booking.duration
    @booking.user = current_user
    @booking.performance = @performance
    if @booking.save
      redirect_to list_bookings_path
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to list_bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_params
    params.require(:booking).permit(:start_date, :duration)
  end
end
