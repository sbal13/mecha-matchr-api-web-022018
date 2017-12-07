class Api::V1::BotsController < ApplicationController

	def index
		@bots = Bot.all
		render json: @bots
	end
end