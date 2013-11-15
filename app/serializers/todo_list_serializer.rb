class TodoListSerializer < ActiveModel::Serializer
  attributes :id
  has_many :todo_items
end
