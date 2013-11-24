require "chatroom/version"

module Chatroom
	# Default way to setup Chatroom. Run rails generate chatroom_install to create
	# a fresh initializer with all configuration values.
	def self.setup
		yield self
	end

end
