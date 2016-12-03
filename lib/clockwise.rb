require_relative 'time_unit'

class Integer
  def seconds
    self
  end

  def minutes
    seconds * 60
  end

  def hours
    minutes * 60
  end

  def days
    hours * 24
  end

  def weeks
    days * 7
  end

  def months
    weeks * 4
  end

  def years
    months * 12
  end

  def later &block
    TimeUnit.new(self).later(&block)
  end

  def earlier
    Time.now - self
  end

  def each &block
    appropriate_unit = TimeUnit.get_appropriate_unit(self)
    TimeUnit.new(self).send("each_#{appropriate_unit}", &block)
  end

  def and time
    self + time
  end

  def method_missing(name, *args, &block)
    if name.to_s.include? "each_"
      TimeUnit.new(self).send("#{name}", &block)
    else
      super
    end
  end
end

