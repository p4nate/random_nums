#!/usr/bin/ruby

$numsA = {1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0, 8 => 0, 9 => 0, 10 => 0, 11 => 0, 12 => 0, 13 => 0, 14 => 0, 15 => 0, 16 => 0, 17 => 0, 18 => 0, 19 => 0, 20 => 0, 21 => 0, 22 => 0, 23 => 0, 24 => 0, 25 => 0, 26 => 0, 27 => 0, 28 => 0, 29 => 0, 30 => 0, 31 => 0, 32 => 0, 33 => 0, 34 => 0, 35 => 0, 36 => 0, 37 => 0, 38 => 0, 39 => 0, 40 => 0, 41 => 0, 42 => 0, 43 => 0, 44 => 0, 45 => 0, 46 => 0, 47 => 0, 48 => 0, 49 => 0} 

$runs = ARGV[0]
$missed = Array.new
$prng = Random.new

def getArg
    if $runs.nil? || $runs == 0 then
        puts "How many times do you want to run? ./rn.rb [ n ] times"
	exit
    else
        $runs = ARGV[0]
    end
end	

    

def countm 
    7.times do
        k = $prng.rand(1..49)
        if $numsA.select {|k,v| k.equal? k} then
            $numsA[k] += 1
        else 
            puts $missed.push(k) 
        end
    end
end

getArg

100.times do
   countm
end

if $missed.empty? then
    puts "im mt"
else
    puts "these fell out"
    puts $missed
end

if true == true then
    puts "it is"
end

puts Hash[$numsA.sort_by{|k, v| v}.reverse]
