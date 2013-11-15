window.ScratchPad =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    @AllNotes = new @Collections.Notes(@notesJson, parse: true)
    view = new @Views.Notes(collection: @AllNotes)
    $('#container').html(view.render().el)

  viewFor: (model) ->
    modelClass = model.constructor.name
    viewClass = @Views[modelClass]
    new viewClass(model: model)

window.App = window.ScratchPad

$(document).ready ->
  ScratchPad.initialize()
