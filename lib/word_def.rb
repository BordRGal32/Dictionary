class WordDef
  attr_reader :value
  def initialize(value)
    @value = value
  end
end

class Word < WordDef

end

class Definition < WordDef

end
