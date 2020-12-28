
class Card
  VALUES = ("A".."Z").to_a

  def self.shuffled_pairs(num_pairs)
    values = VALUES

    while num_pairs > values.length
      values = values + values
    end

    values = values.shuffle.take(num_pairs) * 2
    values.shuffle!
    values.map { |value| self.new(value) }
  end

  attr_reader :value

  def initialize(value, revealed = false)
    @value = value
    @revealed = revealed
  end

  def hide
    @revealed = false
  end

  def to_s
    revealed? ? value.to_s : " "
  end

  def reveal
    @revealed = true
  end

  def revealed?
    @revealed
  end

  def ==(object)
    object.is_a?(self.class) && object.value == value
  end
end


__END__
A Card has two useful bits of information: 
its face value, and whether it is face-up or face-down. 
You'll want instance variables to keep track of this information. 
You'll also want a method to display information about the card: 
nothing when face-down, or its value when face-up. 
I also wrote #hide, #reveal, #to_s, and #== methods.