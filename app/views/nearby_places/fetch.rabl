collection :@nearby_places
attributes :name, :vicinity, :icon, :rating

node(:status) do |np|
  if RegisteredPlace.find_by_google_place_id(np.place_id).present?
    "verified"
  else
    "unverified"
  end
end