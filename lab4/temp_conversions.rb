def convert(temp)
    return "Temperature must be an integer" unless temp.class == Integer
    return "Temperature below Absolute Zero" if temp < -474 
    a = 5.0/9.0
    b = temp-32.0
    c = a*b
    return c
end


puts convert(32)          
puts convert(50)          
puts convert(212)
puts convert("zero")
puts convert(-500)
