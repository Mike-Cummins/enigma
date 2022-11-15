require './lib/enigma'
require'./lib/key_generator'

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

  it 'can split a given message and downcase into individual letters' do
    enigma = Enigma.new

    expect(enigma.split_message("Hello")).to eq(["h", "e", "l", "l", "o"])
  end

  it 'encrypts a message given a message, key, and offset' do
    enigma = Enigma.new

    expect(enigma.encrypt("hello world", "02715", "040895")).to eq({
          encryption: "keder ohulw",
          key: "02715",
          date: "040895"
         })
  end
end