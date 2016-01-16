class PeekAltRoutes
  checkboxEl: '.peek-alt-routes input'
  tipsyEl:    '.peek-alt-routes .btn'

  render: ->
    $(@checkboxEl).on 'change', @checkboxClicked
    $(@tipsyEl).attr('title', @tipsyMessage())
    $(@tipsyEl).tipsy gravity: $.fn.tipsy.autoNS

  checkboxClicked: (event) ->
    document.cookie = "peek-alt-routes=#{event.target.checked}; path=/"
    document.location.reload(true)

  altRoutesEnabled: ->
    $(@checkboxEl)[0].checked

  altRoutesDisplayName: ->
    $(@checkboxEl).siblings('label').text()

  tipsyMessage: ->
    msg = "\'#{@altRoutesDisplayName()}\' is currently "
    if @altRoutesEnabled()
      msg += 'enabled.'
    else
      msg += 'disabled.'

$(document).ready ->
  (new PeekAltRoutes).render()
