class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by(id: params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def create
    task = Task.new(task_params)
    task.save
    redirect_to tasks_path, notice: "タスク「#{task.name}」を登録しました"
  end

  def update
    task = Task.find_by(id: params[:id])
    task.update!(task_params)
    redirect_to tasks_path,notice: "タスク「#{task.name}」を更新しました。"
  end

  def destroy
    task = Task.find_by(id: params[:id])
    task.destroy
    redirect_to tasks_path,notice: "タスク「#{task.name}」を削除しました。",status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:name,:description)
  end
end
