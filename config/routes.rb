Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	namespace :api do
	    namespace :v1 do
	        resources :schools do
	        	resources :school_staffs
	          resources :admissions
	          resources :events
	        end
	        resources :users
	    end
	end

end
