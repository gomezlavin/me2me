class MessagesController < ApplicationController

  def show
    # Retrieves user's messages and tags from DB
    data = Message.getMessagesTags(current_user)
    render json: data
  end

  def update
    # Adds new message to the database
    data = Message.addMessage(params,current_user)
    render json: data
  end

  def search
    # Searchs for messages containing a keyword
    data = Message.searchMessages(params,current_user)
    render json: data
  end

  def tag
    # Retrieves messages with a specific tag from the database
    data = Message.getTaggedMessages(params,current_user)
    render json: data
  end

end
