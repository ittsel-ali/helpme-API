class UserPlacesController < ApplicationController
  before_action :doorkeeper_authorize!

end
