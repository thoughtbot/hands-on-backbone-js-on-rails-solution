class TodoItemsController < ApplicationController
  respond_to :json

  def destroy
    respond_with todo_item.destroy
  end

  private

  def todo_list
    TodoList.find(params[:todo_list_id])
  end

  def todo_items
    todo_list.todo_items
  end

  def todo_item
    todo_items.find(params[:id])
  end
end
