class PhoneNumber
  attr_accessor :number

  def initialize(number,name)
    @number = number
    @name = name
  end

  def to_s
    @name
  end
end
