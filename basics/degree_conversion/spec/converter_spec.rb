require 'rspec'
require_relative '../lib/unit_converter'

RSpec.describe UnitConverter do
  describe 'converter' do
    let(:from_f_100) { UnitConverter.new('F:100') }
    let(:from_f_32) { UnitConverter.new('F:32') }
    let(:from_c_100) { UnitConverter.new('C:100') }
    let(:from_c_32) { UnitConverter.new('C:32') }
    let(:from_k_100) { UnitConverter.new('K:100') }
    let(:from_k_neg_100) { UnitConverter.new('K:-100') }
    let(:from_k_32) { UnitConverter.new('K:32') }
    let(:from_b_100) { UnitConverter.new('B:100') }
    let(:from_b_32) { UnitConverter.new('B:32') }

    context 'From F to C' do
      it { expect(from_f_100.to_c).to eq 37.7778 }
    end

    context 'From B to C [incorrect data]' do
      it { expect(from_b_100.to_c).to eq 'Incorrect input!' }
    end

    context 'From C to F' do
      it { expect(from_c_100.to_f).to eq 212 }
    end

    context 'From C to F [incorrect data]' do
      it { expect(from_b_100.to_f).to eq 'Incorrect input!' }
    end

    context 'From F to K' do
      it { expect(from_f_32.to_k).to eq 273.15 }
    end

    context 'From K to F' do
      it { expect(from_k_32.to_f).to eq(-402.07) }
    end

    context 'From K to F [incorrect data]' do
      it { expect(from_b_32.to_f).to eq 'Incorrect input!' }
    end

    context 'From C to K' do
      it { expect(from_c_32.to_k).to eq 305 }
    end

    context 'From K to C' do
      it { expect(from_k_32.to_c).to eq(-241) }
    end

    context 'From K to F with neg temp' do
      it { expect { UnitConverter.new('K:-100').to_f }.to raise_error 'Incorrect value for scale K' }
    end

    context 'From K to C with neg temp' do
      it { expect { UnitConverter.new('K:-100').to_c }.to raise_error 'Incorrect value for scale K' }
    end
  end
end
