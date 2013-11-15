class App.Collections.Notes extends Backbone.Collection
  url: '/notes'

  model: (data) ->
    if data.body.type == "sticky_note"
      new App.Models.StickyNote(arguments...)
    else
      new App.Models.TodoList(arguments...)
