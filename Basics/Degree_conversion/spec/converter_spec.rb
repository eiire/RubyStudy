require 'rspec'
require_relative '../lib/unit_converter'

RSpec.describe 'TO_CONVERT_UNIT' do
  it 'From F to C' do
    expect(UnitConverter.new('F:100').to_c).to eq 37.7778
  end

  it 'From C to F' do
    expect(UnitConverter.new('C:100').to_f).to eq 212
  end

  it 'From F to K' do
    expect(UnitConverter.new('F:32').to_k).to eq 273.15
  end

  it 'From K to F' do
    expect(UnitConverter.new('K:32').to_f).to eq(-402.07)
  end

  it 'From C to K' do
    expect(UnitConverter.new('C:32').to_k).to eq 305
  end

  it 'From K to C' do
    expect(UnitConverter.new('K:32').to_c).to eq(-241)
  end

  it 'From K to F with neg temp' do
    expect { UnitConverter.new('K:-100').to_f }.to raise_error 'Incorrect value for scale K'
  end

  it 'From K to C with neg temp' do
    expect { UnitConverter.new('K:-100').to_c }.to raise_error 'Incorrect value for scale K'
  end
end
