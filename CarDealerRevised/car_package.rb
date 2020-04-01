require_relative 'car_model'
require_relative 'car_option_list'
require 'set'
require 'forwardable'

class CarPackage
  extend Forwardable

  def initialize(model)
    @model_info = model
    @option_list = CarOptionList.new
  end

  attr_accessor :model_info, :option_list

  def_delegators :option_list, :add_option, :remove_option

  def selected_options_list
    option_list.to_s
  end

  def total_price
    model_info.price + option_list.price
  end

  def cancel_order
    @model_info.id = nil
    @option_list = CarOptionList.new
  end  
end