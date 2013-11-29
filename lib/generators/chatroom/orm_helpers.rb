module Chatroom
	module Generators
		module OrmHelpers
			def model_contents
				buffer = <<-CONTENT
		# validates
		validates :content, :presence => true, :length => { :maximum => 250 }

		EMOTIONS = [
			"smile", "despressed", "like", "dull", "proud", "cry", "shy", "shut_up",
			"nap", "big_cry", "awkward_red", "angry", "naughty", "snag", "surprise", "bad",
			"cool", "awkward", "scream", "vomit", "giggle", "lovely", "who_cares", "zhuai",
			"hungry", "sleepy", "scared", "sweat", "simper", "solider", "strive", "shout",
			"questionaire", "hiss", "dizzy", "impantient", "be_bombed", "skull", "hit_head", "bye"
		]
		
		# The created time of the message
		def send_time
		  self.created_at.strftime("%Y-%m-%d %H:%M:%d")
		end

		# convert the marks to html tags
		def html_content
			return "" if content.blank? 
			str = content.gsub(/\\r\\n/, "<br/>") 
			str = str.gsub(/(\\s)/, "&nbsp;")
			str = str.gsub(/\\[bold\\]/, "<b>")
			str = str.gsub(/\\[-bold\\]/, "</b>")
			str = str.gsub(/\\[italic\\]/, "<i>")
			str = str.gsub(/\\[-italic\\]/, "</i>")
			str = str.gsub(/\\[color:(#.{6})\\]/){ |s| "<span style=\\"color:\#{$1}\\">" }
			str = str.gsub(/\\[-color\\]/, "</span>")
			str = str.gsub(/\\[(\\w+)\\]/) do |s|
				emotion = EMOTIONS.index($1)
				emotion.nil? ? "[\#{$1}]": "<img src=\\"/assets/emotions/\#{emotion}.gif\\" />" 
			end
			return str
		end
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
