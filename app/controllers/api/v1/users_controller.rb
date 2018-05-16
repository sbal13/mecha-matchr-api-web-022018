class Api::V1::UsersController < ApplicationController

	def create
		@user = User.new(username: params[:username], password: params[:password])

		if @user.save
			token = encode({user_id: @user.id})
			render json: {user: @user, 
										matches: prepare_matches(@user.matches),
										bots: Bot.all,
										jwt: token
									}
		else
			render json: {error: "Ya dun goofed!"}
		end
	end
end