class PlacesController < ApplicationController
  before_action :doorkeeper_authorize!
end
