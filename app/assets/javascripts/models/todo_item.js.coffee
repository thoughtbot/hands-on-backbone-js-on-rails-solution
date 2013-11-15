class App.Models.TodoItem extends Backbone.Model
  save: ->
    @collection.todoList.save()
