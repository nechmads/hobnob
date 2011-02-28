class MessagesController < ApplicationController
  #before_filter :protect_resource
  
  def create
    respond_to do |format|
      format.json {
        @new_message = Message.new
        @new_message.body = params[:body]
        @new_message.title = ""
        @new_message.recipient_id = params[:recipient_id]
        @new_message.sender_id = current_user.id
        @new_message.is_read = false
        if @new_message.save
          render :json => @new_message
        else
          render :status => :bad_request, :json => ""
        end
      }
    end
  end
  
  def inbox
    messages = get_messages(:inbox)
    #
  end
  
  def outbox
    get_messages(:outbox)
  end
  
  private
    def get_messages(folder)
      folder = folder == :inbox ? :recipient_id : :sender_id
      respond_to do |format|
        num_of_messages = params[:count] == nil ? 10 : params[:count]
        page = params[:page] == nil ? 0 : params[:page]
        messages = Message.where(folder => current_user.id).limit(num_of_messages).offset(num_of_messages * page).joins("LEFT OUTER JOIN users ON users.id = messages.sender_id LEFT OUTER JOIN identities ON users.default_identity_id = identities.id")
        messages.map!{|m| 
          sender = User.find(m.sender_id)
          sender_identity = Identity.find(sender.default_identity_id)
          m.attributes.merge({:sender_first_name => sender.first_name, :sender_last_name => sender.last_name, :sender_picture_url => sender_identity.photo_url})
        }

        format.json {
          render :json => messages
        }
      end
    end
  
end
