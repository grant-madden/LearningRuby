require_relative 'menu_display'
# Model class
class CarModel
  AVAILBLE_MODELS_AND_PRICES = {
      "E" => 10000,
      "L" => 12000,
      "X" => 18000
    }

  def self.available_models
    AVAILBLE_MODELS_AND_PRICES.keys
  end

  def self.available_model_list
    available_models.join(', ')
  end

  def self.is_available_model?(id)
    available_models.include?(id.upcase)
  end

  def initialize(model_id = nil)
    @id = model_id
  end

  def price
    AVAILBLE_MODELS_AND_PRICES[id] || 0
  end

  def select_model(new_id)
    @id = new_id
  end

  def to_s
    "#{id}"
  end

  def has_selected_model?
    @id != nil
  end

  attr_accessor :id, :selected_options

  private
end

