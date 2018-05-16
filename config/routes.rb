Rails.application.routes.draw do
	namespace :api do
		namespace :v1 do
			resources :bots
			post '/bots/match', to: "bots#match"
			post '/bots/delete_match', to: "bots#delete_match"
			post '/login', to: "auth#login"
			post '/signup', to: "users#create"

			get '/get_user', to: "auth#get_user"

			get '/DO_NOT_USE', to: "bots#reset"
		end
	end

end
