class Dashing.Stthermostat extends Dashing.Widget
  constructor: ->
    super
    @queryState()

  @accessor 'temperature',
    get: -> if @_temperature then Math.floor(@_temperature) else 0
    set: (key, value) -> @_temperature = value

  @accessor 'setpoint',
    get: -> if @_setpoint then Math.floor(@_setpoint) else 0
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
  
