class App.Views.TodoItem extends Backbone.View
  template: JST['todo_items/show']

  className: 'todo-item'

  events:
    'change .todo-item-title': 'saveModel'

  render: ->
    @$el.html(@template(todoItem: @model))
    this

  saveModel: ->
    @model.set
      title: @$('.todo-item-title').val()
    @model.save()
    false
