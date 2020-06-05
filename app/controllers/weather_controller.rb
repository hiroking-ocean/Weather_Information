class WeatherController < ApplicationController
  include WeatherHelper

  def index
    @names = ImageID.new()
  end
end
