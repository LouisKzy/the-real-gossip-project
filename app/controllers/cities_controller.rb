class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @gossips = Gossip.where(user: User.where(city: @city))
  end
end
