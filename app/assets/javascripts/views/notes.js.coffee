class App.Views.Notes extends Marionette.CompositeView
  template: JST['notes/index']

  itemViewContainer: '.notes'

  getItemView: -> App.Views.ShowNote

  regionsHash:
    actionsContainer: '.actions-container'

  initialize: ->
    @addActions = new App.Views.AddActions(collection: @collection)

  onRender: ->
    @$el.append(@addActions.render().el)
