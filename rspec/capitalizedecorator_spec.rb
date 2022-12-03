require '../capitalizedecorator'

describe CapitalizeDecorator do
  it 'creates a new instance of the CapitalizeDecorator class' do
    decorator = CapitalizeDecorator.new('Eva')
    expect(decorator).to be_an_instance_of CapitalizeDecorator
  end

  it 'creates a new instance of the CapitalizeDecorator class with a name' do
    decorator = CapitalizeDecorator.new('Eva')
    expect(decorator.nameable).to eq('Eva')
  end

  it 'capitalizes the name' do
    decorator = CapitalizeDecorator.new('Eva')
    expect(decorator.correct_name).to eq('Eva')
  end
end
