class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @performances = Performance.all
  end

  def dashboard
    @user = @current_user
  end

  def list_perf
    @performances = current_user.performances
  end
end
