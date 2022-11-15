require './lib/key_generator'

RSpec.describe KeyGenerator do
  it 'exists' do
    key_generator = KeyGenerator.new

    expect(key_generator).to be_a(KeyGenerator)
  end

  it 'generates a key, 5 random integers' do
    key_generator = KeyGenerator.new
    key_generator.generate_key

    expect(key_generator.key).to be_a(String)
    expect(key_generator.key.length).to eq(5)
  end

  it 'can generate todays date, DDMMYY' do
    key_generator = KeyGenerator.new
    
    expect(key_generator.generate_date).to be_a(String)
    expect(key_generator.generate_date.length).to eq(6)
end

  it 'generates 4 digit offset based on date DDMMYY' do
    key_generator = KeyGenerator.new
    key_generator.generate_offset('040895')

    expect(key_generator.offset).to eq([1, 0, 2, 5])
  end

  it 'can calculate shift given a key and offset, if >= 27 it %27' do 
    key_generator = KeyGenerator.new
    
    expect(key_generator.generate_shift('02715', '040895')).to eq([3, 0, 19, 20])
  end
end
