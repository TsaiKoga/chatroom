module Chatroom
	module MessageHelper
		def new_communication(msg=nil)
			"<span class='message-line'>
				<div class='info-message'>
					<span class='sender'>:</span><span class='send-time'>#{msg.try(:send_time)}</span>
				</div>
				<span class='say'>#{msg.try(:html_content)}</span>
			</span>"
		end

		# Show all the communications in chatroom
		def show_communications(msgs=nil)
			msgs ||= []
			messages = msgs.collect do |msg|
			"<span class='message-line'>
				<div class='info-message'>
					<span class='sender'>:</span><span class='send-time'>#{msg.try(:send_time)}</span>
				</div>
				<span class='say'>#{msg.try(:html_content)}</span>
			</span>"
			end
			messages.join('')
		end
	end
end
