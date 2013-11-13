window.ScratchPad =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    @AllNotes = new @Collections.Notes
    @AllNotes.fetch().done =>
      new @Routers.ScratchPadRouter
      Backbone.history.start(pushState: true)

window.App = window.ScratchPad

$(document).ready ->
  ScratchPad.initialize()
