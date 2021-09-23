class ChatroomsController < ApplicationController
  def new
    @chatroom = Chatroom.new
  end

  def index
    @chatrooms = Chatroom.all
    @projects = Project.all
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      redirect_to chatrooms_path
    else
      render :new
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def destroy
    @chatroom = Chatroom.find(params[:id])
    @notifications = Notification.all
    @notifications.each do |notification|
      if Notification.first.params[:message].chatroom_id == @chatroom.id
        notification.destroy
      end
    end
    @chatroom.destroy
    redirect_to chatrooms_path
  end

  def chatroom_params
    params.require(:chatroom).permit(:name, user_ids: [])
  end
end
