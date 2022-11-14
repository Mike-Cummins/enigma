require 'date'

class KeyGenerator
  attr_reader :key,
              :offset

  def initialize
    @key = []
    @offset = []
  end

  def generate_key
    5.times do
      num = rand(1...9)
      @key << num
    end
  end

  def generate_offset(date = Date.today)
    date = date.strftime('%d%m%y').to_i
    sq_date = date**2
    @offset = sq_date.digits.pop(4)
  end

  def generate_shift
    shift = []
    generate_key
    generate_offset
    shift << a_shift = key[0] + key[1] + offset[0]
    shift << b_shift = key[1] + key[2] + offset[1]
    shift << c_shift = key[2] + key[3] + offset[2]
    shift << d_shift = key[3] + key[4] + offset[3]
    shift
  end
end
