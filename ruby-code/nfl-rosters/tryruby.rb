require 'rubygems'
require 'date'
hstry = "2010092100"
todate = Date.new(hstry[0..3].to_i, hstry[4..5].to_i, hstry[6..7].to_i)
puts todate.strftime('%d-%m-%Y')
