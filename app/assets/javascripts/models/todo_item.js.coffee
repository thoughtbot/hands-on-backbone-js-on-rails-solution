class App.Models.TodoItem extends Backbone.Model
  validate: ->
    unless @hasTitle()
      "Must provide a title"

  save: ->
    unless @validate()
      @collection.todoList.save()

  hasTitle: ->
    @has("title") && @get("title").trim() != ""

