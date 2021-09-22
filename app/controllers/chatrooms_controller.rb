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

  def chatroom_params
    params.require(:chatroom).permit(:name, user_ids: [])
  end
end
