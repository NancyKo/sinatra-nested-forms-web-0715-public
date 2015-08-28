require './environment'

class Pirate
  attr_accessor :name, :weight, :height 

  def initialize(params)
    @params = params
  end
end

class Ship
  attr_accessor :name, :type, :booty

  def initialize(params)
    @params = params
  end
end 

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here

    get '/' do
      erb :'/root'
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      @pirate = Pirate.new(params)
      @pirate.name = params["pirate"]["name"]
      @pirate.weight = params["pirate"]["weight"]
      @pirate.height = params["pirate"]["height"]

      @shipp = Ship.new(params)
      @shipp.name = params["pirate"]["ships"]['0']["name"]
      @shipp.type = params["pirate"]["ships"]['0']["type"]
      @shipp.booty = params["pirate"]["ships"]['0']['booty']

      @ship = Ship.new(params)
      @ship.name = params["pirate"]["ships"]['1']["name"]
      @ship.type = params["pirate"]["ships"]['1']['type']
      @ship.booty = params["pirate"]["ships"]['1']['booty']
      
      erb :'pirates/show'
      
    end
  end
end

