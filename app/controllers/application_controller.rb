class ApplicationController < ActionController::API
  respond_to :json
  before_action :set_default_request_type
  before_action :doorkeeper_authorize!

  def set_default_request_type
    request.format = :json
  end

  def current_user
    User.find_by_id(doorkeeper_token[:resource_owner_id])
  end
end
