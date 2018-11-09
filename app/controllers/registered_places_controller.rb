class RegisteredPlacesController < ApplicationController
  before_action :doorkeeper_authentication

  def new
    # TBD
  end

  def create
    # TBD
  end

  def update
    # TBD
  end

  def delete
    # TBD
  end

  private

  def permit_params
    params.require(:places).permit
  end
end
