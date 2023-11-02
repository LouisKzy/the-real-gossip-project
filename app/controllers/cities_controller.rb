class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @users = @city.users
    @gossips = Gossip.where(user: User.where(city: @city))

  end
end
