=begin
Step 1: Build a data set of characters.
Step 2: Generate a random number between 0 and dataset length and add that to the password
Step 3: Repeat step 2 for the length of the password
Step 4: Print the password (Or copy it to the pasteboard)

Step 1.1: Shuffle the Dataset
Step 2.1: Use a solid random number generator. 
The .1 steps arent needed but will make a better product

Where -<integer> is the length
-p copies it to pasteboard instead of printing it
-a is lowercase alpha
-A is uppercase alpha
-n is numarics
-s is the full set of symbols
And everything after a -- is included in the mix. 
`pwgen -64 -paAn -- “~!/<>,”` Would produce a 64 character password, copy it to the pasteboard, where the password would contain a-z, A-Z, 0-9, and ~!/<>,
Get it working with a predefined set and work from there though
=end

=begin
require 'securerandom'

class PasswordGenerator

data = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()<>[](){}\\/|".split.shuffle.to_s
password = String.new

puts "How many characters do you want your password to be?"
pass_length = gets.chomp.to_i

pass_length.times do
password << data[rand(data.length)]
end

print password
end
=end

require 'securerandom'
require 'optparse'

class PasswordGenerator
  
  def initialize(string)
    @set = CharacterSet.new(string)
  end

  def start(length)
    password = String.new
    if !@set.empty?
      length.times do
        password << @set.random_char
      end
    end
    puts password
  end

  def self.start(*args)
    opts = Hash.new
    opts[:alpha] = false
    opts[:alpha_caps] = false
    opts[:numeric] = false
    opts[:symbol] = false
    opts[:length] = 0
    
    opt_parser = OptionParser.new do |op|
      op.on("-a", "--alpha")     { |n| opts[:alpha] = true  }
      op.on("-A", "--alpha-cap") { |n| opts[:alpha_caps] = true  }
      op.on("-n", "--numeric")   { |n| opts[:numeric] = true  }
      op.on("-s", "--symbol")   { |n| opts[:symbol] = true  }
      op.on('-l LENGTH', '--length LENGTH') { |n| opts[:length] = n.to_i }
      op.on("-c STRING", "--custom STRING") { |n| opts[:custom] = n }
    end.parse!(args)
    
    string = String.new
    string << "abcdefghijklmnopqrstuvwxyz" if opts[:alpha]
    string << "ABCDEFGHIJKLMNOPQRSTUVWXYZ" if opts[:alpha_caps]
    string << "0123456789" if opts[:numeric]
    string << "!@#$%^&*" if opts[:symbol]
    string << opts[:custom] if opts[:custom]
    
    return new(string).start(opts[:length])
  end
end
#------------------------------------------------------------------
class CharacterSet
  def initialize(string)
    @data = string.split("").uniq.shuffle.freeze
    freeze
  end
  
  def random_char
    return @data[rand(@data.length)]
  end
  
  def empty?
    @data.empty?
  end
  
  def random(length = 1)
    string = String.new
    length.times do
      string << random_char
    end
    return string
  end
end

PasswordGenerator.start(*ARGV)