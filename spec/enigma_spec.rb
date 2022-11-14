require './lib/enigma'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_a(Enigma)
  end

  it 'has an alphabet, lower case, includes a space' do
    enigma = Enigma.new

    expect(enigma.alphabet).to be_a(Array)
    expect(enigma.alphabet.include?("a")).to be(TRUE)
    expect(enigma.alphabet.include?("z")).to be(TRUE)
    expect(enigma.alphabet.include?("m")).to be(TRUE)
    expect(enigma.alphabet.include?(" ")).to be(TRUE)
    expect(enigma.alphabet.count).to eq(27)
  end
end