#!/usr/bin/env ruby -w
# frozen_string_literal: true

# Created by Devon Huxtable <devon.huxtable@gmail.com>, November 2021.

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