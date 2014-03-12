require 'rspec'
require 'word_def'

describe WordDef do
  it 'creates an instance of WordDef' do
    test_instance = WordDef.new("this value")
    test_instance.should be_an_instance_of WordDef
  end
  it 'should initialize the instance of WordDef with the passed value equal to the instance value' do
    test_instance = WordDef.new("this value")
    test_instance.value.should eq "this value"
  end
end

describe Word do
  it 'creates an instance of Word' do
    test_instance = Word.new("this value")
    test_instance.should be_an_instance_of Word
  end
  it 'should initialize the instance of Word with the passed value equal to the instance value' do
    test_instance = Word.new("this value")
    test_instance.value.should eq "this value"
  end
end

describe Definition do
  it 'creates an instance of Definition' do
    test_instance = Definition.new("this value")
    test_instance.should be_an_instance_of Definition
  end
  it 'should initialize the instance of Definition with the passed value equal to the instance value' do
    test_instance = Definition.new("this value")
    test_instance.value.should eq "this value"
  end
end
