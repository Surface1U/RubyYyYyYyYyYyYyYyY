
#1
puts"Say my Name"
v = gets.chomp
puts "Yo #{v}"
a = gets.chomp
case a
when "We have to cook Jesse"
    puts "Yes, Mister White, you're right Mister White"

else
    puts "What the hell #{v}"


end
puts "Yo, Mister White i dont know why u must do this, but please, write something here, i would like it to  be OS program"
cmd = STDIN.gets.chomp
system cmd

puts "Oh no! They want you write something on ruby!"
cmd2 = STDIN.gets.chomp
system "ruby -e \"#{cmd2}\""

#2
#сумма простых делителей 
#2

def prime? (n)
    if n <= 1
        false
    elsif n == 2
        true
    else
        (2..n/2).none? { |i| n % i == 0}
    end
end

def PrimeSum (a)
    sum = 0
    for i in 1..a
        if prime?(i)
            then
            if(a%i == 0)
                then
                sum = sum + i
            end
        end
    end
    return sum
end

puts PrimeSum(10)

#сумма чётных больше трёх
        
def odd (a)
    k = 0
    while a>0
        if ((a%10>3) && ((a%10)%2 == 0))
            then
            k = k+1
        end
        a = a/10
    end
    return k
end

puts odd(23344)
    
#третий метод 
  
def sumDigits (a)
    sum  = 0
    while a > 0
        sum = (a%10) + sum
        a = a/10
    end
    return sum
end

def Composiii (a, b)
    compose = 1
    for i in 1..a
        if(a%i == 0)
            then
            if (sumDigits(i) > sumDigits(b))
                then
                compose = compose * i
            end
        end
    end
    return compose
end

puts Composiii(22, 1)
        
        
#таск 3
#1.13

a = [1,3,33,8,0,1,2,3,4]
min = a[0]
index = 0
l  = a.length
for i in 0..l
    if a[i].to_i < min
        min = a[i]
        index = i
    end
end

d = a[0..index-1]
a[0..index-1] = a[index+1.. l]
a[index+1..l] = d
puts a
        
        
#1.25

arr = [1,3,4,7,3,1,2,23,4,5,6,2,2,3]
a = 3
b = 8
min = arr[0]
max = arr[0]


for i in a..b
    if arr[i].to_i < min
        min = arr[i]
    end
    if arr[i].to_i > max
        max = arr[i]
    end
end


puts max
puts min


