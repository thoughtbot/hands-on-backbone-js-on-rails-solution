class App.Views.TodoList extends Backbone.View
  initialize: ->
    @todoItems = new App.Views.TodoItemsIndex(collection: @model.todoItems)

  render: ->
    @$el.html(@todoItems.render().el)
    this

  remove: ->
    @todoItems.remove(arguments...)
    super(arguments...)
