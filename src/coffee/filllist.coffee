#usage : $('#test').fillList({options:{one:1,two:2,three:3,four:4}, value:4})

$.fn.extend
  fillList: (options) ->
    self = $.fn.fillList
    opts = $.extend {},  options
    $(this).each (i, el) ->
      self.init el, opts
      

$.extend $.fn.fillList,  
  init: (el, opts) ->
    options = opts['options']
    value = opts['value']
    $(el).empty()
    keys = Object.keys(options).sort()
    
    for e in keys
        if options[e] == value
            $(el).append($('<option>').attr({value:options[e],selected:1}).append(e))
        else
            $(el).append($('<option>').attr({value:options[e]}).append(e))
            

