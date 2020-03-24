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
    available_options.each do |i|
      # Case insensitivity
      target_lowered = target.downcase
      i_lowered = i.name.downcase
      # Linear Search
      if i_lowered == target_lowered
        return i
      end
    end
    return nil
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