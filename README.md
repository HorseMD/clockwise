#Clockwise

Ruby integer class extension. Adds methods to "do something after x 'units of time'", do something for each segment of x unit of time, etc...
It also adds basic time arithmetic, allowing very readable time calculation (e.g. `Time.now + 10.minutes`)

##Usage

Some usage examples:

    5.minutes.each do |minute|
        puts "The time is: #{Time.now}"
    end
    The time is: 2014-08-05 15:59:08 +0100
    The time is: 2014-08-05 16:00:08 +0100
    The time is: 2014-08-05 16:01:08 +0100
    The time is: 2014-08-05 16:02:08 +0100
    The time is: 2014-08-05 16:03:08 +0100

    5.hours.each_second { puts "A second has passed!" }
    A second has passed!
    A second has passed!
    ...
    A second has passed!

    2.hours.later { puts "Two hours have passed!" }
    "Two hours have passed!"

    5.minutes.and 2.seconds
     => 302

    120.seconds == 2.minutes
     => true

    Time.now + 5 hours
     => 2014-08-05 20:55:23 +0100

##Units of Time

The different units of time available are as follows:

* Seconds
* Minutes
* Hours
* Days
* Weeks
* Months
* Years

##Notes

This doesn't account for any time drift caused by code passed to it. This is intentional, to keep the gem as minimal as possible.

If the timeunit.later method is given no block, it will return its unit of time added to the current time. For example, 5.minutes.later will return the time that it will be in 5 minutes.

Each unit of time also has an `each_x` method for every unit of time smaller than itself. For example, hours has `each_minute` and `each_second`, minutes has `each_second`, and so on.

