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
			@message = Message.create!(message)
		end

		private
			# Never trust parameters from the scary internet, only allow the white list through.
			def message_params
				params.require(:message).permit(:content)
			end
	end
end
