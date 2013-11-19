class App.Models.TodoList extends Backbone.Model
  constructor: ->
    @todoItems = new App.Collections.TodoItems([], todoList: this)
    super(arguments...)

  parse: (data) ->
    @todoItems.reset(data.body.todo_list.todo_items, parse: true)
    data.todoListId = data.body.todo_list.id
    delete data.body
    data

  toJSON: ->
    {
      title: @get("title")
      body:
        type: "todo_list"
        todo_list:
          todo_items: @todoItems.filter((i) -> i.isValid())
    }
