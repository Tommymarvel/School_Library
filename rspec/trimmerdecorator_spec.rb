require '../trimmerdecorator'

describe TrimmerDecorator do
  it 'creates a new instance of the TrimmerDecorator class' do
    decorator = TrimmerDecorator.new('Eva')
    expect(decorator).to be_an_instance_of TrimmerDecorator
  end

  it 'creates a new instance of the TrimmerDecorator class with a name' do
    decorator = TrimmerDecorator.new('Eva')
    expect(decorator.nameable).to eq('Eva')
  end

  it 'creates a new instance of the TrimmerDecorator class with a trimmed name' do
    decorator = TrimmerDecorator.new('Eva')
    expect(decorator.nameable).to eq('Eva')
  end

  it 'trims strings longer than 10 letters' do
    # Yeah, that was Pablo Picasso's full name :))
    name = TrimmerDecorator.new('Pablo Diego Hose Francesco de Paula Juan Nepomunceno Maria de los Remedios Ciprianos de la Sactissima Trinidad Ruyz y Picasso')
    expect(name.correct_name).to eq('Pablo Dieg')
  end
end
