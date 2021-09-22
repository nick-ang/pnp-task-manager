class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    # @folder = Folder.find(request.referrer.split("/")[-1])
    if @message.save
      redirect_back fallback_location: root_path
      CommentNotification.with(message: @message).deliver(@chatroom.users)
    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
