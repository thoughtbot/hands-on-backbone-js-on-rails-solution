class App.Views.AddActions extends Backbone.View
  template: JST['notes/add-actions']

  className: 'add-actions'

  events:
    'click .add-note': 'addNote'

  render: ->
    @$el.html(@template())
    this

  addNote: ->
    @collection.add({})
    false
