module Chatroom
	module Generators
		class AssetsGenerator < Rails::Generators::Base
			source_root File.expand_path('../../../../app/assets', __FILE__)

			desc "Generators the assets including coffee and sass"

			def generate_stylesheets
				directory "stylesheets/chatroom", "#{stylesheets_target_path}" do |content|
					content
				end
			end

			def generate_coffees
				directory "javascripts/chatroom", "#{javascripts_target_path}" do |content|
					content
				end
			end

			def generate_images
				directory "images", "#{images_target_path}" do |content|
					content
				end
			end

			private
			  def stylesheets_target_path
					@stylesheets_target_path ||= "app/assets/stylesheets/chatroom" 
				end

				def javascripts_target_path
					@javascripts_target_path ||= "app/assets/javascripts/chatroom"
				end

				def images_target_path
					@images_target_path ||= "app/assets/images"
				end
		end
	end
end
