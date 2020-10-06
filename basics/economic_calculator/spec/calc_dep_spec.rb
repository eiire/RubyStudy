require 'rspec'
require 'csv'
require_relative '../lib/econom_calculator'

RSpec.describe EconomCalculator do
  describe 'converter' do
    let(:calculator) { EconomCalculator.new('spec/demo32.csv') }
    let(:incorrect_calculator) { EconomCalculator.new('spec/demo32_incorrect.csv') }
    let(:test_list) { [49_378, 184_398, 396_589, 580_720, 559_918, 665_904] }

    context 'Find min' do
      it { expect(calculator.find_min[1]).to eq test_list.min.to_f }
    end

    context 'Find min' do
      it { expect(calculator.find_min('Единиц')).to eq test_list.min.to_f }
    end

    context 'Find max' do
      it { expect(calculator.find_max[1]).to eq test_list.max.to_f }
    end

    context 'Find max years' do
      it { expect(calculator.find_max('Единиц')).to eq test_list.max.to_f }
    end

    context 'Find mean for column with float point processing recorded as 6,7 and 6.7' do
      it { expect(calculator.find_mean[2].round(2)).to eq 2.92 }
    end

    context 'Find mean with float point processing recorded as 6,7 and 6.7' do
      it { expect(calculator.find_mean('На 1000 человек населения').round(2)).to eq 2.92 }
    end

    context 'Find variance for column with float point processing recorded as 6,7 and 6.7' do
      it { expect(calculator.find_variance[2].round(2)).to eq 2.56 }
    end

    context 'Find variance with float point processing recorded as 6,7 and 6.7' do
      it { expect(calculator.find_variance('На 1000 человек населения').round(2)).to eq 2.56 }
    end

    context 'Find mean max min variance with incorrect data' do
      it { expect(incorrect_calculator.find_mean).to eq "Incorrect data!\n" }
      it { expect(incorrect_calculator.find_max).to eq "Incorrect data!\n" }
      it { expect(incorrect_calculator.find_min).to eq "Incorrect data!\n" }
      it { expect(incorrect_calculator.find_variance).to eq "Incorrect data!\n" }
    end
  end
end
