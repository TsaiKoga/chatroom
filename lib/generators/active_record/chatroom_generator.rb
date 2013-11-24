require "rails/generators/active_record"
require "generators/chatroom/orm_helpers"

module ActiveRecord
	module Generators
		class ChatroomGenerator < ActiveRecord::Generators::Base
			argument :attributes, :type => :array, :default => [], :banner => "field: type field: type"

			source_root File.expand_path('../templates', __FILE__)
			include Chatroom::Generators::OrmHelpers

			def copy_chatroom_migration
				migration_template "migration.rb", "db/migrate/chatroom_create_#{table_name}"
			end

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

				class_path = if namespaced?
											 class_name.to_s.split("::")
										 else
											 [class_name]
										 end
				indent_depth = class_path.size - 1

				content = content.split("\n").map { |line| "  " * indent_depth + line }.join("\n") << "\n"

				inject_into_class(model_path, class_path.last, content) if model_exists?
			end

		end
	end
end
