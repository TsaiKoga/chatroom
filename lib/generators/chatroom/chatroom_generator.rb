module Chatroom
	module Generators
		class ChatroomGenerator < Rails::Generators::NamedBase
			include Rails::Generators::ResourceHelpers

			namespace "chatroom"
			source_root File.expand_path('../templates', __FILE__)

			desc "Generators a model with the given NAME (if one does not exists) with chatroom " <<
					 "configuration plus a migration file and chatroom routes."

			class_option :routes, :desc => "Generate routes", :type => :boolean, :default => true

			hook_for :orm							# 钩子方法：触发orm默认为active_record，现在在Generators::ChatroomGenerator，所以会执行Generators::ActiveRecord所有中的generator
			hook_for :views

			def add_chatroom_routes
				chatroom_route = "resources :#{plural_name}"
				route chatroom_route
			end
		end
	end
end
