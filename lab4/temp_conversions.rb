def convert(temp, measure ="F")
    return "Temperature must be an integer" unless temp.class == Integer
    return "Temperature below Absolute Zero" if below_absolute_zero?(temp, measure) 
    if measure == "F"
        a = 5.0/9.0
        b = temp-32.0
        c = a*b
        return c
    else
        d = temp*2 +30.0
        return d
    end
end

def below_absolute_zero?(temp, measure)
    # your code goes here
    if measure == "F"
        return temp < -474
    else
        return temp < -273
    end
end

puts convert(32)          
puts convert(50)          
puts convert(212)
puts convert("zero")
puts convert(-500)
puts convert(0, "C")
puts convert(10, "C")
puts convert(100, "C")
puts convert(-280, "C")