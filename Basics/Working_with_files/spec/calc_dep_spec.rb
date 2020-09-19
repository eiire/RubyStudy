# frozen_string_literal: true
require 'rspec'
require 'csv'
require_relative '../calculating_dependencies'

describe 'EconomCalculator' do
  it 'min' do
    data = EconomCalculator.new('spec/demo32.csv')
    test_list = [49378, 184398, 396589, 580720, 559918, 665904]
    expect(data.min.split(',')[1]).to eq test_list.min.to_f.to_s
  end

  it 'max' do
    data = EconomCalculator.new('spec/demo32.csv')
    test_list = [49378, 184398, 396589, 580720, 559918, 665904]
    expect(data.max.split(',')[1]).to eq test_list.max.to_f.to_s
  end

  it 'mean Floating point processing recorded as 6,7 and 6.7' do
    expect(EconomCalculator.new('spec/demo32.csv').find_mean.split(',')[2].to_f.round(2)).to eq 2.92
  end

  it 'variance Floating point processing recorded as 6,7 and 6.7' do
    expect(EconomCalculator.new('spec/demo32.csv').variance.split(',')[2].to_f.round(2)).to eq 2.56
  end

  it 'mean max min variance with incorrect data' do
    expect(EconomCalculator.new('spec/demo32_incorrect.csv').find_mean).to eq 'Incorrect data!' + "\n"
    expect(EconomCalculator.new('spec/demo32_incorrect.csv').max).to eq 'Incorrect data!' + "\n"
    expect(EconomCalculator.new('spec/demo32_incorrect.csv').min).to eq 'Incorrect data!' + "\n"
    expect(EconomCalculator.new('spec/demo32_incorrect.csv').variance).to eq 'Incorrect data!' + "\n"
  end
end
