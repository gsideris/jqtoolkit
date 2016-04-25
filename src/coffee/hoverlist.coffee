$.fn.extend
  hoverlist: (options) ->
    self = $.fn.hoverlist
    opts = $.extend {},  options
    $(this).each (i, el) ->
      self.init el, opts
  

$.extend $.fn.hoverlist,    
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
         list = $('<select>').attr({	          
	          'id':  $(el).attr('id')+'-editing'	          
         })
         $(list).insertBefore($(el))
         $(el).hide()
         for v in opts['values']
             if v == html
               $(list).append($('<option>').attr({value:v,selected:'true'}).append(v))
             else
               $(list).append($('<option>').attr({value:v}).append(v))
         
         $(list).focusout ->
            html = $(this).val()
            $(el).html(html)
            $(this).remove()
            $(el).show()
         
       