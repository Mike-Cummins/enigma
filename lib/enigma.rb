require 'date'
require '/key_generator'

class Enigma
  attr_reader :alphabet

  def initialize
    
    @alphabet = ('a'..'z').to_a << ' '
    
  end

  def encrypt(message, key = generate_key, offset = generate_offset)
    require 'pry'; binding.pry
    shift_calculate(key, offset)
    
    message.chars.each do |message_letter|
    end
  end

end
