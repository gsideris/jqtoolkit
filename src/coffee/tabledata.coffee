$.fn.extend
	tabledata: (options) ->
		self = $.fn.tabledata
		opts = $.extend {},  options
		return self.init $(this), opts		
  

$.extend $.fn.tabledata,    
		init: (el, opts) ->      	
			data = []
			$(el).find("tbody tr").each (i,r) ->
				row = []				
				$(r).find("td").each (j,c) ->					
					row.push $(c).text()
				data.push row			
			return data