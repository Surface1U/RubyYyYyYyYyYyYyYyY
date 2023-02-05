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
