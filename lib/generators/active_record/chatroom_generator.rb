require "rails/generators/active_record"
require "generators/chatroom/orm_helpers"

module ActiveRecord
	module Generators
		class ChatroomGenerator < ActiveRecord::Generators::Base
			argument :attributes, :type => :array, :default => [], :banner => "field: type field: type"

			source_root File.expand_path('../templates', __FILE__)
			include Chatroom::Generators::OrmHelpers

			# 复制 messages 的迁移任务到项目中的db/migrate中去。
			def copy_chatroom_migration
				migration_template "migration.rb", "db/migrate/chatroom_create_#{table_name}"
			end

			# 迁移任务字段默认值(使用here document语法)
			def migration_data
<<RUBY
t.text :content, :null => false
RUBY
			end

			def generate_model
				invoke "active_record:model", [name], :migration => false
			end

			def inject_chatroom_content
				content = model_contents

				# 获取类名(用来确定内容插入位置)
				class_path = if namespaced?
											 class_name.to_s.split("::")
										 else
											 [class_name]
										 end
				indent_depth = class_path.size - 1

				# 将model中的内容每一行缩进
				content = content.split("\n").map { |line| "  " * indent_depth + line }.join("\n") << "\n"

				inject_into_class(model_path, class_path.last, content) if model_exists?
			end

		end
	end
end
