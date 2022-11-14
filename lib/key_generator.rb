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
end
