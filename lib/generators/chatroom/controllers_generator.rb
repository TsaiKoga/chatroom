module Chatroom
	# Include this module in your generator to generate Chatroom controllers.
	# 'copy_controllers' is the main method and by default copies all controllers.
	module ControllerPathTemplates
		protected
		def target_path
			@target_path ||= "app/controllers"
		end

		def controller_directory(name, _target_path = nil)
			directory name.to_s, _target_path || "#{target_path}/#{name}"
		end
	end

	class ControllersGenerator < Rails::Generators::Base
		include ControllerPathTemplates
		source_root File.expand_path('../../../../app/controllers', __FILE__)
		desc "Copies Chatroom controllers to your application."

		def copy_controllers
			controller_directory(:chatroom)
		end
	end
end
