array = [10, 91, 2, 333, 4, 5]
for elem in array
     puts elem
end

array2 = ["hi", "you", "ruby", "programming"]
for elem in array2
    puts elem
end

for i in 1..5 
    puts "Value of local variable is #{i}"
    puts array[i]
end

index=0
while index<array.length
     puts "Value of current element is #{array[index]}"
     index+=1
end

n = 0
while n < 4
  puts n
  n += 1
end

30.times {puts "I will not throw paper airplanes"} 

75.times { |i| puts "hello #{i}" }


(1..4).each do |element|
    puts "The Value of the local variable element is #{element}"
    element=element/20
    puts element
    if element%2==0
         puts "the element is even!"
    end
end

 # Array of integers
 [1, 2, 3, 4].each do |element|
    puts "The Value of the local variable i is #{element*65}"
end

# Array of strings
string_array=["a", "b","c", "d"]
string_array.each do |item|
    puts "The value of i is #{item.upcase}"
end

 # Array of integers
 [1, 2, 3, 4].each do |element|
    puts "The Value of the local variable i is #{element*65}"
end

# Array of strings
string_array=["a", "b","c", "d"]
string_array.each do |item|
    puts "The value of i is #{item.upcase}"
end

 # Array of integers
 [1, 2, 3, 4].each do |element|
    puts "The Value of the local variable i is #{element*65}"
end

# Array of strings
string_array=["a", "b","c", "d"]
string_array.each do |item|
    puts "The value of i is #{item.upcase}"
end