$.fn.extend
  takenotes: (values,options) ->
    self = $.fn.takenotes
    opts = $.extend {}, self.default_options, options
    $(this).each (i, el) ->
      self.init el, values, opts
  
$.extend $.fn.takenotes, 
	default_options:
  	rowid : 1
	init: (el, values,opts) ->  
			for v in values
				this.addRow(el,v,opts)
			this.potentialRow(el,opts)

	potentialRow : (el,opts) ->
			fields = opts['fields']
			tbody = $(el).find('tbody')[0]
			row = $('<tr>').attr({class:"opacity7"})   
			self = this
			row.click ->
				row.removeClass("opacity7")
				self.potentialRow(el,opts)
				$(this).off()
        
			$(tbody).append(row)
			opts['rowid'] = opts['rowid'] + 1
			id = opts['rowid']
			elid = $(el).attr('id')
			cellid = 0
			for f in fields
				td = $('<td>')
				$(row).append(td)
				component = $('<span>').attr({id:"#{elid}-#{id}-#{cellid}"}).append(f['default'])
				component.hovertextfield()
				td.append(component)
				cellid = cellid + 1
			remove = $('<a>').attr({href:"#",class:"btn btn-danger"}).append('<span>').attr({class:"glyphicon glyphicon-trash"})
			$(row).append($('<td>').append(remove))			
			remove.click (evt) ->
				evt.preventDefault()					
				$(this).parent().parent().remove()
				
	        
        
	addRow:(el,values,opts) ->
			opts['rowid'] = opts['rowid'] + 1
			id = opts['rowid']
			elid = $(el).attr('id')
			cellid = 0
			tbody = $(el).find('tbody')[0]
			row = $('<tr>')  

			$(tbody).append(row)
			
			for f in values
				td = $('<td>')
				$(row).append(td)
				component = $('<span>').attr({id:"#{elid}-#{id}-#{cellid}"}).append(f)
				component.hovertextfield()
				td.append(component)      
				cellid = cellid + 1
			remove = $('<a>').attr({href:"#",class:"btn btn-danger"}).append('<span>').attr({class:"glyphicon glyphicon-trash"})
			$(row).append($('<td>').append(remove))			
			remove.click (evt) ->
				evt.preventDefault()					
				$(this).parent().parent().remove()
      
      