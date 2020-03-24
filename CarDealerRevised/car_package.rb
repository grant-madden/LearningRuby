require_relative 'car_model'

class CarPackage

  def initialize(model)
    @model_info = model
    @selected_options = []
  end

  attr_accessor :model_info, :selected_options

  def selected_options_list
    if selected_options.empty?
      "(None)"
    else
      selected_options.map(&:to_s).join(", ")
    end
  end

  def search_selected_options(target)
    selected_options.each do |i|
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
      i = CarOption.search_available_options(option)
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
      remove_option(i)
    else
      selected_options.delete(option)
    end
  end

  def total_price
    model_info.price + options_price
  end
  
  def options_price
    if selected_options.empty?
      return 0
    else
      options_price = 0
      selected_options.each do |i|
        options_price = options_price + i.price.to_i
      end
    end
    return options_price
        # selected_options.map(&:price).sum
  end

  def cancel_order
    @model_info.id = nil
    @selected_options = []
  end  
end