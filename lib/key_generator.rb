require 'date'

class KeyGenerator
  attr_reader :key,
              :offset,
              :shift

  def initialize
    @key = key
    @offset = []
    @shift = []

  end

  def generate_key
   @key = rand(10000...99999).to_s  
  end

  def generate_date
    Date.today.strftime('%d%m%y').to_s.delete("/")
  end

  def generate_offset(date)
    sq_date = date.to_i**2
    @offset = sq_date.digits.reverse.pop(4)
  end

  def generate_shift(key_arg = @key, date_arg = @offset)
    new_key = key_arg.chars
    new_offset = generate_offset(date_arg)
    @shift << a_shift = (new_key[0..1].join.to_i + new_offset[0]) % 27
    @shift << b_shift = (new_key[1..2].join.to_i + new_offset[1]) % 27
    @shift << c_shift = (new_key[2..3].join.to_i + new_offset[2]) % 27
    @shift << d_shift = (new_key[3..4].join.to_i + new_offset[3]) % 27
  end
end
