class App.Views.TodoItemsIndex extends Backbone.View
  tagName: 'ul'
  className: 'todo-items'

  initialize: ->
    @listenTo(@collection, "add", @renderItem)
    @listenTo(@collection, "reset", @render)

  render: =>
    @$el.html("")
    @collection.forEach(@renderItem)
    this

  renderItem: (model) =>
    view = new App.Views.TodoItem(model: model, tagName: 'li')
    @$el.append(view.render().el)
