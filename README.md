# Chatroom

The chat room provides you to send messages that including emotions and different kinds
font.

## Installation

Add this line to your application's Gemfile:

    gem 'chatroom'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chatroom


## Usage

After you install Chatroom and add it to your Gemfile, you need to run the generator:

    rails g chatroom:install

Add the code below in your controller where will put the chatroom. Example:

    @messages = Message.all

Add the chatroom to your view. Example:

    <%= render "chatroom/messages/chatroom" %>

Migration Task:

    rake db:migrate

Start faye server in your terminal:

    rackup private_pub.ru -s thin -E production

#####Add User to the Message:

Add a migration and add your code to show user's name in message\_helper.rb:

    rails g migration add_user_id_to_messages

Add hidden field about user\_id in chatroom/message\_helper.rb so as create the message with its ower:

    <%= f.hidden_field :user_id, :value => current_user.id %>

Allow params get the user\_id in chatroom/messages\_controller.rb:

		params.require(:message).permit(:content, :user_id)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
