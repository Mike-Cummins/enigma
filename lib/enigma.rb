require 'date'
require '/key_generator'

class Enigma
  attr_reader :alphabet

  def initialize
    @keymaster = KeyGenerator.new
    @alphabet = ('a'..'z').to_a << ' '
  end

  def encrypt(message, key = generate_key, offset = generate_date)
    new_message = split_message(message)
    shift = @keymaster.generate_shift(key, offset)
    encrypted = new_message.map.with_index do |letter, index|
      new_index = (alphabet.index(letter) + shift[index%4])%27
      alphabet[new_index]
    end.join
    {encryption: encrypted, key: key, date: offset}
  end

  def split_message(message)
    message.downcase.chars
  end
end
