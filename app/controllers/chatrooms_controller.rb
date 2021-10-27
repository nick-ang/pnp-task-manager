class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def new
    @chatroom = Chatroom.new
  end

  def index
    @project_new = Project.new
    @chatrooms = Chatroom.all
    @projects = Project.all
    @project_edit = Project.new
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
    @project_new = Project.new
  end

  def destroy
    @chatroom = Chatroom.find(params[:id])
    @notifications = Notification.all
    # @notifications.each do |notification|
    #   if Notification.first.params[:message].chatroom_id == @chatroom.id
    #     notification.destroy
    #   end
    # end
    @chatroom.destroy
    redirect_to chatrooms_path
  end

  def chatroom_params
    params.require(:chatroom).permit(:name, user_ids: [])
  end
end
