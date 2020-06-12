class WeatherController < ApplicationController
  include WeatherHelper

  def index
    @names = ImageID.new()
    gon.sorted = @names.parse(@names.sorted)
    gon.chart = @names.parse(@names.chart)
    gon.wind = @names.parse(@names.wind)
    gon.wave = @names.parse(@names.wave)
  end
end
