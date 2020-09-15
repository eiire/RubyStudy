require 'rspec'
require_relative 'script'

describe "TO_CONVERT_UNIT" do
  it "From F to C" do
    expect(to_convert_unit("F:100", "C")).to eq 37.7778
  end

  it "From C to F" do
    expect(to_convert_unit("C:100", "F")).to eq 212
  end

  it "From F to K" do
    expect(to_convert_unit("F:32", "K")).to eq 273.15
  end

  it "From K to F" do
    expect(to_convert_unit("K:32", "F")).to eq -402.07
  end

  it "From C to K" do
    expect(to_convert_unit("C:32", "K")).to eq 305
  end

  it "From K to C" do
    expect(to_convert_unit("K:32", "C")).to eq -241
  end

  it "From K to F with neg temp" do
    expect(to_convert_unit("K:-100", "F")).to eq nil
  end

  it "From K to C with neg temp" do
    expect(to_convert_unit("K:-100", "C")).to eq nil
  end
end
