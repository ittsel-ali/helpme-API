class PlacesController < ApplicationController
	before_action :doorkeeper_authentication
	before_action :initialize_places

	def get_nearby
		arg = permit_params
		nearby_places = @client.spots(arg[:lat], arg[:lng], :types => PlaceTypes, :radius => LARGE_RADIUS)
		
		repond_with nearby_places 
	end

	def get_connected
		arg = permit_params
		connected_place = @client.spots(arg[:lat], arg[:lng], :radius => SMALL_RADIUS)[0]
	
		respond_with connected_place
	end

	private

	def initialize_places
		@client = GooglePlaces::Client.new(API_KEY)
	end

	def permit_params
		params.require(:places).permit(:lng, :lat)
	end
end
