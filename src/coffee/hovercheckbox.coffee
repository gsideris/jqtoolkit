#usage : $('#test').hoverCheckbox()
$.fn.extend
  hoverCheckbox: (options) ->
    self = $.fn.hoverCheckbox
    opts = $.extend {}, self.default_options, options
    $(this).each (i, el) ->
      self.init el, opts
  

$.extend $.fn.hoverCheckbox,    
   default_options:
      checked:"Yes",
      unchecked:"No"
      
   init: (el, opts) ->          
      $(el).hover (->
         $(this).css 'color', 'red'
         return
      ), ->
         $(this).css 'color', 'black'
         return

      $(el).click ->
         html = $(el).html()
         parent = $(el).parent()
         
         textfield = $('<input>').attr({
              'type': 'checkbox',
              'id':  $(el).attr('id')+'-editing'              
         })
         if html == opts['checked']
            $(textfield).attr('checked',true)
         $(textfield).insertBefore($(el))
         $(el).hide()
         $(textfield).focusout ->
            html =  opts['unchecked']
            if $(this).prop("checked") == true
                html =  opts['checked']               
            $(el).html(html)
            $(this).remove()
            $(el).show()
