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
  
    attr_reader :model_id, :selected_options, :total_price
    attr_accessor :model_id, :selected_options, :total_price
  
    # def model_id
    #   @model_id
    # end
  
    def to_s
      "Model: #{model_id}"
    end
  
    def total_price
      base_price + options_price
    end
  
    def base_price
      {
        "X" => 5000,
        "L" => 7500,
        "E" => 22500,
      }[model_id]
    end
  
    def options_price
      selected_options.map(&:price).sum
    end
  
    def add_option(option)
      selected_options.push(option)
    end
  
    def remote_option(option)
      selected_options.delete(option)
    end
  end