module Chatroom
	module Generators
		class ChatroomGenerator < Rails::Generators::NamedBase
			include Rails::Generators::ResourceHelpers

			namespace "chatroom"
			source_root File.expand_path('../templates', __FILE__)

			desc "Generators a model with the given NAME (if one does not exists) with chatroom " <<
					 "configuration plus a migration file, controller_file, assets_file, views_file and chatroom routes." << 
					 "Setup the faye server for chatting."

			class_option :routes, :desc => "Generate routes", :type => :boolean, :default => true

			hook_for :orm
			hook_for :assets

			def add_chatroom_routes
				chatroom_route = <<-ROUTE
resources :#{plural_name}, module: 'chatroom'
				ROUTE
				route chatroom_route
			end

			def setup_private_pub
				gem 'private_pub', '1.0.3'
				gem 'thin', '1.5.1'
				generate 'private_pub:install'

				inject_into_file 'app/assets/javascripts/application.js', before: '//= require_tree .' do <<-RUBY
//= require private_pub
				RUBY
				end
			end
		end
	end
end
