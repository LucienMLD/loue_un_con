class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @performances = Performance.all
  end

  def dashboard
    @user = @current_user

    @marker = Gmaps4rails.build_markers(@user) do |user_address, marker|
      marker.lat user_address.latitude
      marker.lng user_address.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def list_perf
    @performances = current_user.performances
  end

  def list_bookings
    @bookings = current_user.bookings
  end
end
