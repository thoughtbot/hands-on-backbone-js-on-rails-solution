class App.Routers.ScratchPadRouter extends Backbone.Router
  routes:
    '': 'index'
    'notes/:id': 'showNote'

  index: ->
    view = new App.Views.Notes(collection: App.AllNotes)
    $('#container').html(view.render().el)

  showNote: (id) ->
    model = App.AllNotes.get(id)
    view = new App.Views.EditNote(model: model)
    $('#container').html(view.render().el)
