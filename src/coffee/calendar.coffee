# usage:  $('#test').makeCalendar({id:999,month:3,year:2016,data:{9:[]}})
#         $('#test').addToCalendar({id:999,event:"Test",day:12,style:"label-danger"})


$.fn.extend
  addToCalendar: (options) ->
    self = $.fn.addToCalendar
$.fn.extend
  addToCalendar: (options) ->
    self = $.fn.addToCalendar
    opts = $.extend {},  options
    $(this).each (i, el) ->
      self.init el, opts
  

$.extend $.fn.addToCalendar,    
   init: (el, opts) ->
    id=opts['id']
    day=opts['day']
    event=opts['event']
    style=opts['style']
    $("#calendar-#{id}-tbody-#{day}").append($('<span>').attr({'class': "label #{style}"}).append(event)) 



$.fn.extend
  makeCalendar: (options) ->
    self = $.fn.makeCalendar
    opts = $.extend {},  options
    $(this).each (i, el) ->
      self.init el, opts
  

$.extend $.fn.makeCalendar,    
   init: (el, opts) ->
    this.create_calendar(opts['id'],el,opts['month'],opts['year'],opts['data'])


   create_calendar_panel : (body,status) ->
    return $('<div>').attr({
        'class': "alert #{status}"
    
    }).append(body)

   create_calendar_entry : (day,id) ->
     return $('<span>').append(
       $('<h4>').append(
         $('<center>').append(day)
       )).append(
           $('<hr>')
       ).append(
           $('<div>').attr({id:"calendar-#{id}-tbody-#{day}"})
       )



   create_calendar : (id,el,month,year,data) ->
    d = new Date(year, month, 1)
    monthDays = new Date(d.getYear(), d.getMonth()+1, 0).getDate()
  
    $(el).append(
       $('<table>').attr({
         'class': 'table',
         'id' : "calendar-#{id}"
       }).append(
         $('<thead>').append(
           $('<tr>').append(
             $('<th>').append('Sun')
           ).append(
             $('<th>').append('Mon')
           ).append(
             $('<th>').append('Tue')
           ).append(
             $('<th>').append('Wed')
           ).append(
             $('<th>').append('Thu')
           ).append(
             $('<th>').append('Fri')
           ).append(
             $('<th>').append('Sat')
           )
         )
       ).append(
         $('<tbody>').attr({id:"calendar-#{id}-tbody"})
       )    
    )  
    row = $('<tr>')  
    $("#calendar-#{id}-tbody").append(row)
    days = 1
    if d.getDay() > 0
      for i in [0..d.getDay() - 1]
        row.append($('<td>').append(this.create_calendar_panel('','alert-default')))      
    for i in [d.getDay()..6]      
      row.append($('<td>').append(this.create_calendar_panel(this.create_calendar_entry(days,id),'alert-success')))
      days = days + 1
      
    while days < monthDays
      row = $('<tr>')
      $("#calendar-#{id}-tbody").append(row)
      for i in [days..days+6]
        if days <= monthDays
          row.append($('<td>').append(this.create_calendar_panel(this.create_calendar_entry(days,id),'alert-success')))
        else
          row.append($('<td>').append(this.create_calendar_panel('','alert-default')))      
        
        days = days + 1
    
    for k,v of data    
      $("#calendar-#{id}-tbody-#{k}").append(v)


