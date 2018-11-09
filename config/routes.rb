Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: 'registrations' }
  use_doorkeeper do
  skip_controllers :authorizations, :applications,
    :authorized_applications
  
end

resource :places, only: [] do
  	collection do 
  		post 'get_nearby'
  		post 'get_connected'
  	end 
  end  
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
