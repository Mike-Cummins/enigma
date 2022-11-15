require './lib/key_generator'

RSpec.describe KeyGenerator do
  it 'exists' do
    key_generator = KeyGenerator.new

    expect(key_generator).to be_a(KeyGenerator)
  end

  it 'has a key, empty by default' do
    key_generator = KeyGenerator.new

    expect(key_generator.key).to eq([])
  end

  it 'has an offset, empty by default' do
    key_generator = KeyGenerator.new

    expect(key_generator.offset).to eq([])
  end

  it 'generates a key, 5 random integers' do
    key_generator = KeyGenerator.new
    key_generator.generate_key

    expect(key_generator.key).to be_a(Array)
    expect(key_generator.key.count).to eq(5)
  end

  it 'generates 4 digit offset based on date DDMMYY, today by default' do
    key_generator = KeyGenerator.new

    expect(key_generator.generate_offset).to be_a(Array)
    expect(key_generator.generate_offset.count).to eq(4)
  end

  it 'calculates shift based on key and offset' do
    key_generator = KeyGenerator.new
    key_generator.generate_shift

    expect(key_generator.shift).to be_a(Array)
    expect(key_generator.shift[0]).to be_a(Integer)
    expect(key_generator.shift.count).to eq(4)
  end

  it 'can calculate shift given a key and offset' do 
    key_generator = KeyGenerator.new
    
    expect(key_generator.shift_calculate('02175', '040895')).to eq([3, 3, 10, 17])
  end
end
