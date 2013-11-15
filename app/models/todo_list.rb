class TodoList < ActiveRecord::Base
  include NoteBody

  has_many :todo_items, inverse_of: :todo_list, dependent: :destroy
end
