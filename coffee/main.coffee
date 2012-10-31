window.resevertikalen =
  add_widget: (widget) ->
    @[widget.name] = widget
    @[widget.name].parent = @
    if widget.call_when_assigned
      widget.call_when_assigned()
      if widget.persistent == false then widget.remove()
    return

  remove_widget: (widget_name) ->
    delete @[widget_name]
    @[widget_name] = null
    return

class Widget
  persistent: true
  constructor: (@name) ->
    console.log @name
    return
  remove: ->
    console.log @parent
    @parent.remove_widget @.name
    delete @
    return

class Hyrbil extends Widget
  persistent: false
  call_when_assigned: ->
    @render()
    return
  render: ->
    console.log "renderar hyrbilar"
    return

class Hotell extends Widget
  render: ->
    console.log "renderar hotell"
    return

jQuery =>
    window.resevertikalen.init()
    new window.resevertikalen.add_widget(new Hotell("hotellwidget"))
    window.resevertikalen.hotellwidget.render()
    new window.resevertikalen.add_widget(new Hyrbil("hyrbilswidget"))
  return
return