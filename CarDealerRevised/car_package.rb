require_relative 'car_model'
require 'set'

class CarPackage
  def initialize(model)
    @model_info = model
    @selected_options = Set.new
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
    selected_options.find { |opt| opt.name.casecmp(target) == 0 }
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
      selected_options.add(option)
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
    # selected_options
    #   .map {|opt| opt.price }
    #   .reduce { |sum, value| sum = sum + value } || 0

    selected_options
      .map(&:price)
      .reduce(&:+) || 0
  end

  def cancel_order
    @model_info.id = nil
    @selected_options = Set.new
  end  
end