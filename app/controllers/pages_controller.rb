class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if current_user
      @projects = current_user.projects
      @users = User.all
      if current_user.tasks
        @tasks = current_user.tasks
        @tasks.each do |task|
          task.status
        end
      end
    end
  end
end
