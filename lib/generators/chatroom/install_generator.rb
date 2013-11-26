# require "rails/generators"
module Chatroom
	module Generators
		class InstallGenerator < Rails::Generators::Base
			source_root File.expand_path('../templates', __FILE__)

			desc "Create a Chatroom initalizer and run generators."
			class_option :orm

			def install_app
				generate "chatroom messages"
			end

		end
	end
end
