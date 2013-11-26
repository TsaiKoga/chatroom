require "rails"

module Chatroom
	class Engine < Rails::Engine
		# ==> HookFor Configuration
		# It allows you to implement a generators command by hooking for views,
		# helpers or controllers.
		config.generators do |g|
			g.views				:views
			g.helpers			:helpers
			g.controllers	:controllers
		end
	end
end
