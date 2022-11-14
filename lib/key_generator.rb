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
end
