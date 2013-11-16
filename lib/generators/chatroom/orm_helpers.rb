module Chatroom
	module Generators
		module OrmHelpers
			def model_contents
				buffer = <<-CONTENT
		# validates
		validates :content, :presence => true, :length => { :maximum => 250 }
				CONTENT
				buffer
			end

			private
				def model_exists?
					File.exists?(File.join(destination_root, model_path))
				end

				def migration_exists?
					Dir.glob("#{File.join(destination_root, migration_path)}/[0-9]*_*.rb").grep(/\d+_add_devise_to_#{table_name}.rb$/).first
				end

				def migration_path
					@migration_path ||= File.join("db", "migrate")
				end

				def model_path
					@model_path ||= File.join("app", "models", "#{file_path}.rb")
				end
		end
	end
end
