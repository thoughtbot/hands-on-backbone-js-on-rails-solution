class App.Views.StickyNote extends Backbone.View
  template: JST['notes/sticky_note']

  events:
    'change .note-content': 'saveModel'

  render: ->
    @$el.html(@template(note: @model))
    this

  saveModel: ->
    @model.save()
    false
