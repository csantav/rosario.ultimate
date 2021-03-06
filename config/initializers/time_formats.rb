Time::DATE_FORMATS[:arg_time_format] = "%a. %e.%b %Y - %H:%M"


  # %a - The abbreviated weekday name (``Sun'')
  # %A - The  full  weekday  name (``Sunday'')
  # %b - The abbreviated month name (``Jan'')
  # %B - The  full  month  name (``January'')
  # %c - The preferred local date and time representation
  # %d - Day of the month (01..31)
  # %e - Day of the month without leading zeroes (1..31)
  # %H - Hour of the day, 24-hour clock (00..23)
  # %I - Hour of the day, 12-hour clock (01..12)
  # %j - Day of the year (001..366)
  # %k - Hour of the day, 24-hour clock w/o leading zeroes ( 0..23)
  # %l - Hour of the day, 12-hour clock w/o leading zeroes ( 1..12)
  # %m - Month of the year (01..12)
  # %M - Minute of the hour (00..59)
  # %p - Meridian indicator (``AM''  or  ``PM'')
  # %P - Meridian indicator (``am''  or  ``pm'')
  # %S - Second of the minute (00..60)
  # %U - Week  number  of the current year,
  #         starting with the first Sunday as the first
  #         day of the first week (00..53)
  # %W - Week  number  of the current year,
  #         starting with the first Monday as the first
  #         day of the first week (00..53)
  # %w - Day of the week (Sunday is 0, 0..6)
  # %x - Preferred representation for the date alone, no time
  # %X - Preferred representation for the time alone, no date
  # %y - Year without a century (00..99)
  # %Y - Year with century
  # %Z - Time zone name
  # %z - Time zone expressed as a UTC offset (``-04:00'')
  # %% - Literal ``%'' character
 
  #  t = Time.now
  #  t.strftime("Printed on %m/%d/%Y")   #=> "Printed on 04/09/2003"
  #  t.strftime("at %I:%M%p")            #=> "at 08:56AM"
  #  t.strftime("%e %B, %Y")	       #=> "9 April, 2003"
  #  t.strftime("%Y-%m-%dT%H:%M:%S")     #=> "2003-04-09T08:56:07" (EN 28601)