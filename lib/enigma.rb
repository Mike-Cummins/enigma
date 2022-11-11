class Enigma
  def generate_key
    rand(10000...99999)
  end
  def alphabet
    ("a".."z").to_a << " "
  end
  
end