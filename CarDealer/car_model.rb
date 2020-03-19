require_relative 'car_option'

# Model class
class CarModel
    def self.available_models
      ["X", "E", "L"]
    end
  
    def initialize()
      @model_id = "N/A"
      @selected_options = []
      @total_price = 0
      # raise "Unknown model" unless CarModel.available_models.include?(model_id)
    end
    
    attr_accessor :model_id, :selected_options, :total_price
  
    def to_s
      "Model: #{model_id}"
    end
  
    def total_price
      base_price + options_price()
    end
  
    def base_price
      {
        "E" => 10000,
        "L" => 12000,
        "X" => 18000,        
      }[model_id]
    end
  
    def options_price
      if selected_options == []
        options_price = 0
      else
        options_price = 0
        selected_options.each do |i|
          options_price = options_price + i.price.to_i
        end
      end
        # selected_options.map(&:price).sum
      return options_price
    end
  
    def add_option(option)
      selected_options.push(option)
    end
  
    def remove_option(option)
      selected_options.delete(option)
    end

    def cancel_order
      selected_options.each {|i| remove_option(i)}
      @model_id = "N/A"
      @selected_options = []
      @total_price = 0
    end
    
  end