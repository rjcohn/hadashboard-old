class Dashing.Stthermostat extends Dashing.Widget
  constructor: ->
    super
    @queryState()

  @accessor 'temperature',
    get: -> if @_value then Math.floor(@_value) else 0
    set: (key, value) -> @_temperature = value

  @accessor 'setpoint',
    get: -> if @_value then Math.floor(@_value) else 0
    set: (key, value) -> @_setpoint = value

  queryState: ->
    $.get '/smartthings/dispatch',
      widgetId: @get('id'),
      deviceType: 'thermostat',
      deviceId: @get('device')
      (data) =>
        json = JSON.parse data
        @set 'temperature', json.temperature
        @set 'setpoint', json.setpoint

  ready: ->

  onData: (data) ->

  onClick: (event) ->
  
