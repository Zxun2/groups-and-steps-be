class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :update, :destroy]
  
    # GET /todos
    def index
        # get current user todos
        @todos = current_user.todos
        json_response(@todos)
    end
  
    # POST /todos
    def create
        # create todos belonging to current user
        @todo = current_user.todos.create!(todo_params)
        @newTodo = current_user.todos
        json_response(@newTodo, :created)
    end
  
    # GET /todos/:id
    def show
      json_response(@todo)
    end
  
    # PUT /todos/:id
    def update
      @todo.update(todo_params)
      @newTodo = current_user.todos
      json_response(@newTodo.sort_by(&:id), :created)
    end
  
    # DELETE /todos/:id
    def destroy
      @todo.destroy
      @newTodo = current_user.todos
      json_response(@newTodo.sort_by(&:id), :created)
    end
  
    private
  
    def todo_params
      # whitelist params
      params.permit(:title)
    end
  
    def set_todo
      @todo = Todo.find(params[:id])
    end
  end