# usage: $('#test2').iterateColumn({column:3, function:f})

$.fn.extend
  iterateColumn: (options) ->
    self = $.fn.iterateColumn
    opts = $.extend {}, options
    $(this).each (i, el) ->
      self.init el, opts
  

$.extend $.fn.iterateColumn,    
   init: (el, opts) -> 
      column = opts['column']
      func = opts['function']
      $(el).find("tbody tr td:nth-child(#{column})").each (i,o) ->
          func(o)
      return

