require 'sinatra/base'
require 'sinatra/reloader'

class App < Sinatra::Base
  configure :development do
    Bundler.require :development
    register Sinatra::Reloader
  end

  get '/' do
    get_weather_info
    get_train_info
    erb :index
  end

  # 天気情報取得
  def get_weather_info
    require 'uri'
    require 'net/http'
    require 'yaml'
    # 大阪の天気取得
    data = Net::HTTP.get(URI.parse('http://weather.livedoor.com/forecast/webservice/json/v1?city=270000'))
    forecast_obj = YAML.load(data)

    today_temperature_min = '--'
    today_temperature_max = '--'
    tomorrow_temperature_min = '--'
    tomorrow_temperature_max = '--'
    unless forecast_obj['forecasts'][0]['temperature']['min'].nil?
      today_temperature_max = forecast_obj['forecasts'][0]['temperature']['min']['celsius']
    end
    unless forecast_obj['forecasts'][0]['temperature']['max'].nil?
      today_temperature_max = forecast_obj['forecasts'][0]['temperature']['max']['celsius']
    end
    unless forecast_obj['forecasts'][1]['temperature']['min'].nil?
      today_temperature_max = forecast_obj['forecasts'][1]['temperature']['min']['celsius']
    end
    unless forecast_obj['forecasts'][1]['temperature']['max'].nil?
      today_temperature_max = forecast_obj['forecasts'][1]['temperature']['max']['celsius']
    end

    @today = { 
      weather_state: forecast_obj['forecasts'][0]['telop'],
      temperature_min: today_temperature_min,
      temperature_max: today_temperature_max,
      image_url: forecast_obj['forecasts'][0]['image']['url']
    }
    @tomorrow = {
      weather_state: forecast_obj['forecasts'][1]['telop'],
      temperature_min: tomorrow_temperature_min,
      temperature_max: tomorrow_temperature_max,
      image_url: forecast_obj['forecasts'][1]['image']['url']
    }
  end

  # 鉄道情報取得
  def get_train_info

  end
end
