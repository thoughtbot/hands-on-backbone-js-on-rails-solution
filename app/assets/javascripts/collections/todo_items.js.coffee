class App.Collections.TodoItems extends Backbone.Collection
  initialize: (data, options) ->
    @todoList = options.todoList

  model: App.Models.TodoItem
