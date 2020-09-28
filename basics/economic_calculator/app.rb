require_relative 'lib/econom_calculator'

class App
  def run
    data = EconomCalculator.new('demo32.csv')
    print data.columns_name
    print data.min
    print data.max
    print data.find_mean
    print data.variance
  end
end

App.new.run
