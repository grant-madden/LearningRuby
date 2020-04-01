require_relative 'car_option'
require 'set'
require 'forwardable'

class CarOptionList
  extend Forwardable

  ALL_OPTIONS = 
  [
    ['Leather Seats', 5000], 
    ['DVD System', 1000], 
    ['10 Speakers', 800], 
    ['Navigation System',1400], 
    ['CarPlay', 500], 
    ['Android Auto', 500], 
    ['Lane Monitoring', 2000]
  ].map do |(option_name, option_price)|
    CarOption.new(option_name, option_price)
  end

  def self.available_options
    @@available_options ||= CarOptionList.new(ALL_OPTIONS)
  end

  def initialize(car_options = [])
    @options = Set.new(car_options)
  end

  def_delegators :options, :length, :[]

  def search(target)
    options.find { |opt| opt.name.casecmp(target) == 0 }
  end

  def to_s(separator = ", ")
    return options.map(&:to_s).join(separator) unless options.empty?
    "(None)"
  end

  def has_option_name?(name)
    !!search(name)
  end

  def add_option(option)
    #change?
    if option.is_a?(String)
      i = CarOptionList.available_options.search(option)
      if i.nil?
        puts "Error, option \"#{option}\" not available."
        return
      end
      add_option(i)
    else
      options.add(option)
    end
  end

  def remove_option(option)
    if option.is_a?(String)
      i = search(option)
      if i.nil?
        puts "Error, option \"#{option}\" not available."
        return
      end
      remove_option(i)
    else
      options.delete(option)
    end
  end

  def price
    # options
    #   .map {|opt| opt.price }
    #   .reduce { |sum, value| sum = sum + value } || 0

    options
      .map(&:price)
      .reduce(&:+) || 0
  end

  private
  
  attr_accessor :options

end