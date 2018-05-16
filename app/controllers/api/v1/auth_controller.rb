class Api::V1::AuthController < ApplicationController

	def login
		@user = User.find_by(username: params[:username])

		if @user && @user.authenticate(params[:password])
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

	def get_user
		if user_in_session
			render json: {user: user_in_session, 
										matches: prepare_matches(user_in_session.matches),
										bots: Bot.all,
									}
		else
			render json: {error: "Ya dun goofed!"}
		end

	end

end