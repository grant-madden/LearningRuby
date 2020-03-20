require_relative 'menu_helpers'
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

  def self.is_available_model?(model_id)
    available_models.include?(model_id)
  end
  
  attr_accessor :model_id, :selected_options, :total_price

  def initialize
    @model_id = nil
    @selected_options = []
    @total_price = 0
    # raise "Unknown model" unless CarModel.available_models.include?(model_id)
  end

  def select_model
    print "Select a model (#{CarModel.available_model_list}): "
    new_id = gets.chomp.upcase
    if !CarModel.is_available_model?(new_id)
      select_model
    end
    @model_id = new_id
  end

  def has_selected_model?
    @model_id != nil
  end

  def to_s
    "#{model_id}"
  end

  def selected_options_list
    if selected_options.empty?
      "(None)"
    else
      selected_options.map(&:to_s).join(", ")
    end
  end

  def search_selected_options(target)
    CarModel.selected_options.each do |i|
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

  def add_option(option)
    if option.is_a?(String)
      i = search_available_options(option)
      if i.nil?
        puts "Error, option \"#{option}\" not available."
        return
      end
      add_option(i)
    else
      selected_options.push(option)
    end
  end

  def remove_option(option)
    if option.is_a?(String)
      i = search_selected_options(option)
      if i.nil?
        puts "Error, option \"#{option}\" not available."
        return
      end
      add_option(i)
    else
      selected_options.delete(option)
    end
  end

  def total_price
    base_price + options_price()
  end

  def base_price
    AVAILBLE_MODELS_AND_PRICES[model_id]
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

  def cancel_order
    @model_id = nil
    @selected_options = []
    @total_price = 0
  end  
end

