# Option class
class CarOption
  def self.available_options
    @@available_options
  end

  def self.available_options_list
    available_options.map(&:to_s).join("\n")
  end

  # Search all options
  def self.search_available_options(target)
    available_options.find { |opt| opt.name.casecmp(target) == 0 }
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

# Adds all options to option class
[['Leather Seats', 5000], 
['DVD System', 1000], 
['10 Speakers', 800], 
['Navigation System',1400], 
['CarPlay', 500], 
['Android Auto', 500], 
['Lane Monitoring', 2000]
].each do |(option_name, option_price)|
  CarOption.new(option_name, option_price)
end 