class App.Views.Notes extends Backbone.View
  template: JST['notes/index']

  initialize: ->
    @addActions = new App.Views.AddActions(collection: @collection)
    @listenTo(@collection, 'reset', @render)
    @listenTo(@collection, 'add', @renderNote)

  render: =>
    @$el.html(@template())
    @collection.forEach(@renderNote)
    @$el.append(@addActions.render().el)
    this

  renderNote: (note) =>
    view = new App.Views.ShowNote(model: note, tagName: 'li')
    @$('.notes').append(view.render().el)
