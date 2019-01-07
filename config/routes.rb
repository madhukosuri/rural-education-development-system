Rails.application.routes.draw do
  resources :items
  devise_for :users, :controllers => {:registrations => "registrations"}
  post 'authenticate', to: 'authentication#authenticate'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  constraints format: :json do
	namespace :api do
	    namespace :v1 do
	        resources :schools, :defaults => { :format => 'json' } do
	        	resources :school_staffs
	          	resources :admissions
	         	resources :events
	        end
	        resources :users
	    end
	end
  end
end
