# frozen_string_literal: true
require 'rspec'
require 'csv'
require_relative 'calculating_dependencies'

describe 'EconomCalculator' do
  it 'min' do
    data = EconomCalculator.new('demo32.csv')
    test_list = [49378, 184398, 396589, 580720, 559918, 665904, 627703, 763493, 853647, 798824, 635835, 604942, 640837,
        685910, 703412, 699430, 639321, 669376, 644101, 667971, 693730, 611646, 608336, 611436, 583942, 620730]
    expect(data.min.split(',')[1]).to eq test_list.min.to_f.to_s
  end
end