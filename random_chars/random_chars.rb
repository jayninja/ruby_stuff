def array_to_string(array)
  char_set_string = ""
  array.each { |x|
  char_set_string << x
}
return char_set_string 
end

#define out char pool
lower_alpha = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
upper_alpha = lower_alpha.map(&:upcase)
numbers = ["0","1","2","3","4","5","6","7","8","9"]

# create the pool
char_set = [lower_alpha, upper_alpha, numbers]
char_set = char_set.flatten

random_array = []
(1..100).each { |i|
  random_array.push(char_set.sample)
}

puts array_to_string(random_array)

