require 'rubygems'
require 'bundler'
Bundler.setup(:default, :ci)

require 'rspec'
require_relative '../classy_car_dealer.rb'

class FakeIO < StringIO
    def write(str)
        # $stdout.puts("WRITE TO BUFFER: #{str}")
        super(str)
    end
end