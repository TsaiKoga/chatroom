# Use this hook to configure Chatroom generators.
Chatroom.setup do |config|
	# ==> HookFor Configuration
	# It allows you to implement a generators command by hooking for views,
	# helpers or controllers.
	config.generators do |g|
		g.views				:views
		g.helpers			:helpers
		g.controllers	:controllers
	end
end
