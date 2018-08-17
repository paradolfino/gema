class Gematria
  attr_accessor :vowel_sum

  def create_alphabet
    arr = ('a'..'z').to_a
    count = 1; vals = {}
    arr.each { |i| vals[i] = count; count < 9 ? count += 1 : count = 1 }
    vals
  end

  def translate(input)
    temp = input
    input = input.strip.downcase.split('')
    vowels = ["a","e","i","o","u"]; @vowel_sum = []
    input.each { |i| @vowel_sum << alphabet[i] if vowels.include?(i) }
    puts @vowel_sum
    alphabet = create_alphabet; translation = []
    input.each { |i| translation << (alphabet[i] || 0) }
    sequence = translation.join
    p "#{temp}:: Sequence: #{sequence} Sum #{translation.reduce(&:+)}"
    sum(translation.join)
  end

  def sum(translation)
    if translation == 11 || translation == 22 || translation == 33
      output translation
    else
      val = translation.to_s.split('')
      if val.length > 1
        val = val.reduce(&:+).each_char.map(&:to_i).reduce(&:+)
        sum val
      else
        output translation
      end
    end
  end

  def output(translation)
    p "Number: #{translation}"
  end
end

result = Gematria.new
p 'Input a string: '
input = gets.chomp
result.translate(input)
