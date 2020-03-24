require_relative 'menu_display'
# Model class
class CarModel
  AVAILBLE_MODELS_AND_PRICES = {
      "E" => 10000,
      "L" => 12000,
      "X" => 18000,        
    }

  def self.available_models
    AVAILBLE_MODELS_AND_PRICES.keys
  end

  def self.available_model_list
    available_models.join(', ')
  end

  def self.is_available_model?(id)
    available_models.include?(id)
  end
  
  attr_accessor :id, :selected_options, :price

  def initialize
    @id = nil
    @price = 0
    # raise "Unknown model" unless CarModel.available_models.include?(id)
  end

  def select_model
    print "Select a model (#{CarModel.available_model_list}): "
    new_id = gets.chomp.upcase
    if !CarModel.is_available_model?(new_id)
      select_model
    end
    @id = new_id
  end

  def has_selected_model?
    @id != nil
  end

  def price
    @price = AVAILBLE_MODELS_AND_PRICES[id]
  end

  def to_s
    "#{id}"
  end

end

