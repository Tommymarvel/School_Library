require '../decorator'

describe Decorator do
  it 'creates a new instance of the Decorator class' do
    decorator = Decorator.new('Tommy')
    expect(decorator).to be_an_instance_of Decorator
  end

  it 'creates a new instance of the Decorator class with a name' do
    decorator = Decorator.new('Tommy')
    expect(decorator.nameable).to eq('Tommy')
  end
end
