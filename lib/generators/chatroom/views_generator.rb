module Chatroom
	# Include this module in your generator to generate Chatroom views.
	# 'copy_views' is the main method and by default copies all views.
	module ViewPathTemplates

		# Comments: 重写 included 钩子方法， 这样扁平化;
		# base(ViewGenerators) 就可以使用 ViewPathTemplates 和 ClassMethods 的方法了
		def self.included(base)
			base.extend ClassMethods
			# base.class_eval do
				# argument :scope, :require => false, :default => nil,
				 # :desc => "The scope to copy view to"
			# end
		end

		module ClassMethods
			def hide!
				Rails::Generators.hide_namespace self.namespace
			end
		end

		protected
			# Comments: 要复制到的默认目的路径
			def target_path
				@target_path ||= "app/views/chatroom"
			end

			# Comments: 用于复制 view 文件.
			# Params: name为要复制的文件名，_target_path是使用这个方法的后带有的目的路径.
      def view_directory(name, _target_path = nil)
        directory name.to_s, _target_path || "#{target_path}/#{name}" do |content|
					content
				end
			end
	end

	# Comments: Views 模板生成器，用来生成各种 views 文件到你的 applicatoins 中。
	class ViewsGenerator < Rails::Generators::Base
		include ViewPathTemplates
		# TODO: 之后将app/文件放到lib/外，这里要改。
		source_root File.expand_path('../../../app/views/chatroom', __FILE__)

		desc "Copies Chatroom views to your application."

		def copy_views
			view_directory :messages
		end
	end
end
