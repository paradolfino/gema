

def create_alphabet
	arr = ("a".."z").to_a
	count = 1; vals = {}
	arr.each { |i| vals[i] = count; count < 9 ? count += 1 : count = 1 }
	vals
end

def translate input
	alphabet = create_alphabet; translation = []
	input.strip.downcase.split("").each { |i| alphabet[i] ? translation << alphabet[i] : translation << 0 }
	sequence = translation.join
	p "#{input}:: Sequence: #{sequence} Sum #{translation.reduce(&:+)}"
	sum(translation.join)
end

def sum translation
	if translation == 11 || translation == 22 || translation == 33
		output translation
	else
		val = translation.to_s.split("")
		if val.length > 1
			val = val.reduce(&:+).each_char.map(&:to_i).reduce(&:+)
			sum val
		else
			output translation
		end
	end
end

def output translation
	p "Number: #{translation}"
end

p "Input a string: "
input = gets.chomp
translate(input)