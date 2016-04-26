#usage: $('#test').modalIt({id:1234, action:myaction})
$.fn.extend
  modalIt: (options) ->
    self = $.fn.modalIt
    opts = $.extend {}, self.default_options, options
    $(this).each (i, el) ->
      self.init el, opts
      

$.extend $.fn.modalIt,
  default_options:
    title: 'Title'
    ok:'OK'
    cancel:'Cancel'
    
  
  init: (el, opts) ->
    dialog = this.create el, opts
    $('body').append(dialog)
    id = opts['id']
    predisplay = opts['predisplay']
    postdisplay = opts['postdisplay']
    action = opts['action']
    if predisplay
        predisplay(el)
    dialogid = "modal-container-#{id}"
    okid = "modal-container-#{id}-ok"
    $("##{dialogid}").modal('show');
    if postdisplay
        postdisplay(el)
    do (dialogid,okid,el,action) ->      
        $("##{okid}").click (evt) ->
            evt.preventDefault()
            action(dialogid,el)

  
  create: (el, opts) ->
    title = opts['title']
    ok = opts['ok']
    cancel = opts['cancel']    
    id = opts['id']
    
    return $('<div>').attr({
        'class': 'modal fade',
        'id': "modal-container-#{id}",
        'role': 'dialog'        
    }).append(
        $('<div>').attr({
            'class': 'modal-dialog'
        }).append(
            $('<div>').attr({
                'class': 'modal-content'
            }).append(
                $('<div>').attr({
                    'class': 'modal-header'
                }).append(
                    $('<button>').attr({
                        'type': 'button',
                        'class': 'close',
                        'data-dismiss': 'modal',
                        'aria-hidden': 'true'
                    }).append('×')
                ).append(
                    $('<h4>').attr({
                        'class': 'modal-title'                    
                    }).append("#{title}")
                )
            ).append(
                $('<div>').attr({
                    'class': 'modal-body'
                }).append(el)
            ).append(
                $('<div>').attr({
                    'class': 'modal-footer'
                }).append(
                    $('<button>').attr({
                        'type': 'button',
                        'class': 'btn btn-default',
                        'id': "modal-container-#{id}-cancel",
                        'data-dismiss': 'modal'
                    }).append("#{cancel}")
                ).append(
                    $('<button>').attr({
                        'type': 'button',
                        'id': "modal-container-#{id}-ok",
                        'class': 'btn btn-primary'        
                    }).append("#{ok}")
                )
            )
        )
    )

