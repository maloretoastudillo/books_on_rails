class MessagesController < ApplicationController

    def index
        @send_messages = Message.all.where(sender_id: current_user.id)
        @received_messages = Message.all.where(recipient_id: current_user.id)
    end
end