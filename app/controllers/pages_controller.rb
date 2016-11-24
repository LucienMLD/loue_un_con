class PagesController < ApplicationController
  before_action :list_bookings
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @performances = Performance.all
  end

  def dashboard
    @performances = current_user.performances
    # @booking_demands = []
    @booking_demands = Booking.joins(:performance => :user).where.not(:user_id => current_user.id)

    @marker = Gmaps4rails.build_markers(current_user) do |user_address, marker|
      marker.lat user_address.latitude
      marker.lng user_address.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def list_bookings
    if !current_user.nil?
      @bookings = current_user.bookings
    end
  end

  def list_perf
    @performances = current_user.performances
  end
end
