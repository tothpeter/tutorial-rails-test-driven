class TodosController < ApplicationController
  before_filter :authenticate

  def index
    @todos = current_user.todos
  end

  def new
    @todo = Todo.new
  end

  def create
    if current_user.todos.create todo_params
      redirect_to todos_path
    else
      flash[:error] = "Todo was NOT successfully created."
      render :new
    end
  end

  private 
  
  def todo_params
    params.require(:todo).permit(:title)
  end
end