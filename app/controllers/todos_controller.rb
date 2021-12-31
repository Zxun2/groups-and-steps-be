class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :update, :destroy]

    # GET /allitems
    def all_items 
      user_id = current_user.id
      todos_created = current_user.todos
      items = Array.new()
      for todo in todos_created do 
        item = Item.find_by! todo_id: todo.id
        items.push(item)
      end
      
      json_response(items)
    end

    # GET /todos
    def index
        # get current user todos
        @todos = current_user.todos
        response = {message: Message.todos_fetched, todos: @todos.sort_by(&:id)}
        json_response(response)
    end
  
    # POST /todos
    def create
        # create todos belonging to current user
        @todo = current_user.todos.create!(todo_params)
        @newTodo = current_user.todos
        response = {message: Message.todos_created, todos: @newTodo.sort_by(&:id)}
        json_response(response, :created)
    end
  
    # GET /todos/:id
    def show
      json_response(@todo.items)
    end
  
    # PUT /todos/:id
    def update
      @todo.update(todo_params)
      @newTodo = current_user.todos
      response = {message: Message.todos_updated, todos: @newTodo.sort_by(&:id)}
      json_response(response, :created)
    end
  
    # DELETE /todos/:id
    def destroy
      @todo.destroy
      @newTodo = current_user.todos
      response = {message: Message.todos_deleted, todos: @newTodo.sort_by(&:id)}
      json_response(response, :created)
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