$.fn.extend
  hovertextfield: (options) ->
    self = $.fn.hovertextfield
    opts = $.extend {}, self.default_options, options
    $(this).each (i, el) ->
      self.init el, opts
  

$.extend $.fn.hovertextfield,    
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
	          'type': 'text',
	          'id':  $(el).attr('id')+'-editing',
	          'value': html
         })
         $(textfield).insertBefore($(el))
         $(el).hide()
         $(textfield).focusout ->
            html = $(this).val()
            $(el).html(html)
            $(this).remove()
            $(el).show()
         
     
  