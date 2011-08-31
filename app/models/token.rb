class Token
  VOWELS = %w[a e i o u]
  CONSONANTS = ("a".."z").to_a - VOWELS
  NUMBERS = (0..9).to_a

  def self.readable(size = 12)
    String.new.tap do |s|
      half = size / 2

      1.upto(size) do |i|
        if i == half
          char = NUMBERS.sample.to_s
        elsif i.odd?
          char = CONSONANTS.sample
        else
          char = VOWELS.sample
        end

        s << (NUMBERS.sample.even? ? char.upcase : char)
      end
    end
  end
end