class App.Views.ShowNote extends Marionette.Layout
  template: JST['notes/show']

  className: 'note'

  events:
    'change .note-title': 'saveModel'
    'keydown .note-title': 'blurIfEnter'
    'focus .note-title, .note-content': 'beginEditing'
    'blur .note-title, .note-content': 'endEditing'
    'click .destroy-note': 'destroyNote'

  modelEvents:
    'invalid error': 'addError'

  bindings:
    '.note-title': 'title'
    '.note-content': 'content'

  regions:
    footer: '.normal-footer'
    body: '.body'

  onRender: ->
    @stickit()
    @footer.show(new App.Views.LastUpdated(model: @model))
    @body.show(App.viewFor(@model))

  saveModel: ->
    @model.save()
    false

  blurIfEnter: (e) ->
    if e.keyCode == 13
      @$(':input').blur()

  beginEditing: ->
    @$el.addClass('editing')
    @$el.removeClass("error")

  endEditing: ->
    @$el.removeClass('editing')

  addError: =>
    @$el.addClass("error")

  destroyNote: ->
    @model.destroy()
    @remove()
    false
