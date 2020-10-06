require_relative 'lib/econom_calculator'

class App
  def run
    data = EconomCalculator.new('demo32.csv')
    print "#{data.to_columns_name.join(',')}\n"
    print "#{data.find_min.join(',')}\n"
    print "#{data.find_max.join(',')}\n"
    print "#{data.find_variance.join(',')}\n"
    print "Years (mean): #{data.find_mean('Годы')}\n"
  end
end

App.new.run
