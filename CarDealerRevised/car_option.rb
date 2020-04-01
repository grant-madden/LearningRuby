# Option class
class CarOption
  def initialize(name, price)
    @name = name
    @price = price.to_i
    # = @@available_options || []   (=)    ||= 
    @@available_options ||= []
    @@available_options.push(self) 
  end

  def to_s
    "#{name} ($#{price})"
  end

  attr_accessor :name, :price
end

