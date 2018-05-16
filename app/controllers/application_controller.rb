class ApplicationController < ActionController::API

	def prepare_match(bot_match)
		return {id: bot_match.id, bot: bot_match.bot}
	end

	def prepare_matches(matches)
		return matches.map{|bot_match| prepare_match(bot_match)}
	end


	def encode(payload)
		JWT.encode(payload, "arbi")
	end

	def decode
		jwt = request.headers["Authorization"]
		JWT.decode(jwt, "arbi")[0]
	end

	def user_in_session
		id = decode["user_id"]
		User.find(id)
	end
end
