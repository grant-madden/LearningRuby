# Option class
class CarOption
    def self.available_options
      @@available_options
    end
  
    def initialize(name, price)
      @name = name
      @price = price
      # = @@available_options || []   (=)    ||= 
      @@available_options ||= []
      @@available_options.push(self) 
    end
  
    def to_s
      "#{name} ($#{price})"
    end
  
    attr_reader :name, :price
  end