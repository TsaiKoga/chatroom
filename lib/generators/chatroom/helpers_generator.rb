module Chatroom
	# Include this module in your generator to generate Chatroom helpers.
	# 'copy_helpers' is the main method and by default copies all helpers.
	module HelperPathTemplates
		protected
		def target_path
			@target_path ||= "app/helpers"
		end

		def helper_directory(name, _target_path = nil)
			directory name.to_s, _target_path || "#{target_path}/#{name}"
		end
	end

	class HelpersGenerator < Rails::Generators::Base
		include HelperPathTemplates
		source_root File.expand_path('../../../../app/helpers', __FILE__)
		desc "Copies Chatroom helpers to your application."

		def copy_helpers
			helper_directory(:chatroom)
		end
	end
end
