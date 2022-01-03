class ItemsController < ApplicationController
  before_action :set_todo
  before_action :set_todo_item, only: [:show, :update, :destroy]
    
    # GET /todos/:todo_id/items
    def index
      response = {message: Message.items_fetched, steps: @todo.items.sort_by(&:id)}
      json_response(response)
    end
  
    # GET /todos/:todo_id/items/:id
    def show
      json_response(@item)
    end
  
    # POST /todos/:todo_id/items
    def create
      item = @todo.items.create!(item_params)
      response = {message: Message.items_created, steps: @todo.items.sort_by(&:id), step: item}
      json_response(response, :created)

    end
  
    # PUT /todos/:todo_id/items/:id
    def update
      @item.update(item_params)
      response = {message: Message.item_updated, item: @item, params: item_params}
      json_response(response)
    end
   
    # DELETE /todos/:todo_id/items/:id
    def destroy
      @item.destroy
      response = { message: Message.item_deleted, item: @item}
      json_response(response)
    end

    private
  
    def item_params
      params.permit(:step, :completed, {:tags => []}, Date. :deadline)
    end
  
    def set_todo
      @todo = Todo.find(params[:todo_id])
    end
  
    def set_todo_item
      @item = @todo.items.find_by!(id: params[:id]) if @todo

    end
  end