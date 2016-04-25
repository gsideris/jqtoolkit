$.fn.extend
  tagit: (options) ->
    self = $.fn.tagit
    opts = $.extend {}, self.default_options, options
    $(this).each (i, el) ->
      self.init el, opts
  

$.extend $.fn.tagit,    
   init: (el, opts) -> 
      pattern = opts['pattern']
      style = opts['style']
      text = $(el).html()
      re = new RegExp("\\b"+pattern+"\\b","g")       
      $(el).html(text.replace(re,'<span class="label '+style+'">'+pattern+'</span>'))
      
      
      