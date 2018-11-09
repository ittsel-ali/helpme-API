class NearbyPlacesController < PlacesController
  before_action :initialize_google_api
  before_action :set_args

  def fetch
    nearby_places = @client.spots(@user_location[:lat], @user_location[:lng], :types => PLACE_TYPES, :radius => LARGE_RADIUS)

    respond_with nearby_places
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
    @client.spots(@user_location[:lat], @user_location[:lng], :radius => SMALL_RADIUS)
  end

  private

  def initialize_google_api
    @client = GooglePlaces::Client.new(GOOGLE_API_KEY)
  end

  def permit_params
    args = params.require(:nearby_place).permit(user_location_attributes: [:lng, :lat])

    if params[:nearby_place][:place_id].present?
      args = args.merge(place_id: params[:nearby_place][:place_id])
    end


    args
  end

  def set_args
    @args = permit_params
    @user_location = @args[:user_location_attributes]
  end
end
