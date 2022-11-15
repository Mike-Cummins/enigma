require 'date'

class KeyGenerator
  attr_reader :key,
              :offset,
              :shift

  def initialize
    @key = []
    @offset = []
    @shift = []
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
    generate_key
    generate_offset
    @shift << a_shift = key[0] + key[1] + offset[0]
    @shift << b_shift = key[1] + key[2] + offset[1]
    @shift << c_shift = key[2] + key[3] + offset[2]
    @shift << d_shift = key[3] + key[4] + offset[3]
  end

  def shift_calculate(key, date)
    new_key = []
    new_shift = []
    split_key = key.split(//)
    split_key.each do |num|
      new_key << num.to_i
    end
    date = date.to_i
    sq_date = date**2
    new_date = sq_date.digits.reverse.pop(4)

    new_shift << a_shift = new_key[0] + new_key[1] + new_date[0]
    new_shift << b_shift = new_key[1] + new_key[2] + new_date[1]
    new_shift << c_shift = new_key[2] + new_key[3] + new_date[2]
    new_shift << d_shift = new_key[3] + new_key[4] + new_date[3]
    new_shift
  end
end
