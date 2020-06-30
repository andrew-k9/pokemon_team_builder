class Gens
  attr_accessor :name, :id

  def initialize(name, id)
    @name = name
    @id = id
  end

  class << self
    attr_reader :all

    def populate
      @all = []
      8.times do |i|
        @all << new("Gen #{i + 1}", i + 1)
      end
    end
  end
end
