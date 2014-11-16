# Class for helper methods and any time-related methods that are slightly more
# in-depth than just basic addition.
class TimeUnit
  attr_reader :value

  def initialize val
    @value = val
    raise ArgumentError, "Cannot do something for 0 time!" unless @value > 0
  end

  # Get the biggest unit of time that makes up the given number of seconds
  def self.get_appropriate_unit val
    if val < 1.minutes
      return "second"
    elsif val < 1.hours
      return "minute"
    elsif val < 1.days
      return "hour"
    elsif val < 1.weeks
      return "day"
    elsif val < 1.months
      return "week"
    elsif val < 1.years
      return "month"
    else
      return "year"
    end
  end

  # After x units of time, or, if no block is given, the time in x time units
  def later &block
    if block_given?
      sleep @value
      block.call @value
    else
      Time.now + @value
    end
  end

  # For every unit of time, we create an each_[timeunit] method.
  %w[second minute hour day week month year].each do |unit|
    define_method("each_#{unit}") do |&arg|
      each_x(1.send("#{unit}s"), &arg)
    end
  end

  private
    # each_minute each_hour each_day etc...
    def each_x time, &block
      if time > @value
        raise ArgumentError, "Cannot split a unit of time into parts bigger than itself"
      end
      1.upto @value/time do |val|
        sleep time
        if block_given?
          block.call val
        else
          yield val
        end
      end
      nil
    end
end
