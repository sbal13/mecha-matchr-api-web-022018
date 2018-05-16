class Api::V1::BotsController < ApplicationController

	def index
		@bots = Bot.all
		render json: @bots
	end

	def match
		@user = user_in_session
		@bot = Bot.find(params[:bot_id])

		@match = Match.new(user: @user, bot: @bot)

		if @match.save
			render json: prepare_match(@match)
		else
			render json: {message: "Ya dun goofed!"}
		end
	end

	def delete_match
		@match = Match.find(params[:match_id])
		if @match && @match.user == user_in_session
			@match.destroy
			render json: {message: "To the scrapyard with you!"}
		else
			render json: {message: "This is not the droid you are looking for."}
		end
	end


	def reset
		Resetter.reset
	end


end