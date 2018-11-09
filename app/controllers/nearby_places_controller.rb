class NearbyPlacesController < ApplicationController
  before_action :doorkeeper_authentication
  before_action :initialize_places
  before_action :set_args

  def fetch
    nearby_places = @client.spots(@args[:lat], @args[:lng], :types => PLACE_TYPES, :radius => LARGE_RADIUS)

    respond_with @args
  end

  def connectable
    connectable_places = get_immediate_places

    respond_with connectable_places
  end

  def connect
    connectable_places = get_immediate_places
    arr = []
    connectable_places.each do |v|
      arr.push(v.place_id)
    end

    respond_with do
      if arr.include?(@args[:place_id])
        # TBD
      else
        # TBD
      end
    end
  end

  def disconnect
    connectable_places = get_immediate_places
    arr = []
    connectable_places.each do |v|
      arr.push(v.place_id)
    end

    respond_with do
      if arr.include?(@args[:place_id])
        # TBD
      else
        # TBD
      end
    end
  end

  def get_immediate_places
    @client.spots(@args[:lat], @args[:lng], :radius => SMALL_RADIUS)
  end

  private

  def initialize_places
    @client = GooglePlaces::Client.new(GOOGLE_API_KEY)
  end

  def permit_params
    args = parmas.permit(:lng, :lat)
    args.merge!(:place_id) if parmas[:place_id].present?

    args
  end

  def set_args
    @args = permit_params
  end
end
