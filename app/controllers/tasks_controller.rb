class TasksController < ApplicationController
  before_action :require_user_logged_in,only:[:index,:show]
  before_action :correct_user,only: [:destroy,:edit,:show,:update]
 def index
   @tasks = current_user.tasks.order(id: :desc).page(params[:page]).per(5)
 end
    
 def show
 end
    
 def new
   @task = Task.new
 end
    
 def create
   @task = current_user.tasks.build(task_params)
   
   if @task.save
     flash[:success] = 'taskが正常に投稿されました。'
     redirect_to @task
   else
     @tasks = current_user.tasks.order(id: :desc).page(params[:page])
     flash.now[:danger] = 'taskが投稿されませんでした'
     render 'toppages/index'
   end
 end
 
 def edit
 end
 
 def update
   
   if @task.update(task_params)
     flash[:success] = 'Taskは正常に投稿されました。'
     redirect_to @task
   else
     flash.now[:danger] = 'Taskは更新されていませんでした。'
     render :edit
   end
 end
  
  
 def destroy
   @task.destroy
   
   flash[:success] ='Taskは正常に削除されました。'
   redirect_back(fallback_location: root_path)
 end
 
 private

 
 def task_params
   params.require(:task).permit(:content, :status)
 end
 
 def correct_user
   @task = current_user.tasks.find_by(id: params[:id])
   unless @task
     redirect_to root_url
   end
 end
 
end
