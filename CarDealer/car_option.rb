# Option class
class CarOption
    def self.available_options
      @@available_options
    end
  
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