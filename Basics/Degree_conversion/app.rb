require_relative 'lib/unit_converter'

# program entry point
class App
  @user_input = String
  def initialize
    puts 'Hi, enter the unit in format [unit:value] you want to translate with: '
    @user_input = gets.chop
  end

  def run
    puts 'Hello, enter the unit you want to translate into: '
    convert_to = gets.chop

    begin
      convert = UnitConverter.new(@user_input)
      puts convert.to_c if convert_to == 'C'
      puts convert.to_f if convert_to == 'F'
      puts convert.to_k if convert_to == 'K'
    rescue RuntimeError => e
      puts e.message
    end
  end
end

App.new.run
