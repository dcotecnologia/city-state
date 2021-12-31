# frozen_string_literal: true

class GR::Continent
  attr_reader :code, :name

  def initialize(code: nil, name: nil)
    @code = code
    @name = name
  end
end
