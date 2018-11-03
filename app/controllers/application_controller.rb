class ApplicationController < ActionController::API
	respond_to :json
	before_action :set_default_request_type

	def set_default_request_type
		request.format = :json
	end
end
