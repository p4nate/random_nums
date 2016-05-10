#!/usr/bin/ruby

require 'fileutils'

def ha
    $numsA = {1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0, 8 => 0, 9 => 0, 10 => 0, 11 => 0, 12 => 0, 13 => 0, 14 => 0, 15 => 0, 16 => 0, 17 => 0, 18 => 0, 19 => 0, 20 => 0, 21 => 0, 22 => 0, 23 => 0, 24 => 0, 25 => 0, 26 => 0, 27 => 0, 28 => 0, 29 => 0, 30 => 0, 31 => 0, 32 => 0, 33 => 0, 34 => 0, 35 => 0, 36 => 0, 37 => 0, 38 => 0, 39 => 0, 40 => 0, 41 => 0, 42 => 0, 43 => 0, 44 => 0, 45 => 0, 46 => 0, 47 => 0, 48 => 0, 49 => 0} 
end

logDir = '/home/nathan/ruby/rndata'
ha
$runs = ARGV[0]
$rounds = ARGV[1]
$missed = Array.new
$prng = Random.new

def getArgs
    if $runs.nil? || $runs == 0 then
        puts "How many times per run do you want to run? ./rn.rb [ n ] times"
	exit
    else
        $runs = ARGV[0]
    end
     if $rounds.nil? || $rounds == 0 then
        print "running one round of runs\n"
        $rounds = 1
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

if ! Dir.exists? ( logDir )  then
    FileUtils.mkdir logDir, :mode => 0700
end
    
def ocountm
    puts Hash[$numsA.sort_by{|k, v| v}.reverse[0..6]]
end

def wlog
    t = Time.now
    ext = '.log'
    puts t
    tt = [t.year, t.month,t.day,t.hour,t.min,t.sec,ext].join
    puts tt
end

getArgs
wlog

$rounds.to_i.times do
    $runs.to_i.times do
        countm
    end
    ocountm
end

if $missed.empty? then
    puts "im mt"
else
    puts "these fell out"
    puts $missed
end
