module Chatroom
	# Include this module in your generator to generate Chatroom views.
	# 'copy_views' is the main method and by default copies all views.
	module ViewPathTemplates

		def self.included(base)
			base.extend ClassMethods
		end

		module ClassMethods
			def hide!
				Rails::Generators.hide_namespace self.namespace
			end
		end

		protected
			def target_path
				@target_path ||= "app/views/chatroom"
			end

      def view_directory(name, _target_path = nil)
        directory name.to_s, _target_path || "#{target_path}/#{name}" do |content|
					content
				end
			end
	end

	class ViewsGenerator < Rails::Generators::Base
		include ViewPathTemplates
		source_root File.expand_path('../../../../app/views/chatroom', __FILE__)

		desc "Copies Chatroom views to your application."

		def copy_views
			view_directory :messages
		end
	end
end
