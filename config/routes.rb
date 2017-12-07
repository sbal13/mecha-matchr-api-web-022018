Rails.application.routes.draw do
	namespace :api do
		namespace :v1 do
			resources :bots

			get '/DO_NOT_USE', to: "bots#reset"
		end
	end

end
