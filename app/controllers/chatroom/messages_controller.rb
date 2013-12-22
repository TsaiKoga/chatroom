module Chatroom
	class MessagesController < ApplicationController
		# GET /messages
		def index
			@messages = Message.all
		end

		# POST /messages
		# POST /messages.json
		def create
			message = message_params
			message[:content] = prevent_script(message[:content])
			@message = Message.create!(message)
		end

		private
			# Never trust parameters from the scary internet, only allow the white list through.
			def message_params
				params.require(:message).permit(:content)
			end

			def prevent_script(text)
				txt = text.gsub(/<(\s*)([^\d\W\s]+)(\s*)([;\-\w="'\s:\/\.]+)>/) do |s|
					"\\<#{$1}#{$2}#{$3}#{$4}\>"
				end
				txt = txt.gsub(/<\/(\s*)([^\d\W\s]+)(\s*)([;\-\w="'\s:\/\.]+)>/) do |s|
					"\\</#{$1}#{$2}#{$3}#{$4}>"
				end
				return txt
			end
	end
end
