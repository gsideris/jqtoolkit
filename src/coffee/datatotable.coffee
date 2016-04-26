#usage : $('#test').dataToTable({function: f,data:[[1,2,3],[,4,5,6]] })

$.fn.extend
  dataToTable: (options) ->
    self = $.fn.dataToTable
    opts = $.extend {},  options
    $(this).each (i, el) ->
      self.init el, opts
      

$.extend $.fn.dataToTable,
  
  init: (el, opts) ->
    func = opts['function']
    tbody = $(el).find("tbody")[0] 
    data = opts['data']
    $(tbody).empty()
    for r in data
      row = $('<tr>')
      for c in r
        if func
            col = $('<td>').append(func(c))
        else
            col = $('<td>').append("#{c}")
        $(row).append(col)
      $(tbody).append(row)



