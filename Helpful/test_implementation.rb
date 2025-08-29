# test_implementation.rb
require 'json'
require "benchmark/ips"
require "benchmark"

puts "Ruby Engine: #{RUBY_ENGINE}"
puts "JSON::Parser: #{JSON::Parser}"
#puts "JSON::Generator: #{JSON::Generator}"

# Test functionality
#json_str = File.read("benchmark/data/twitter.json")

def kernel(json_str)
    parsed = JSON.parse(json_str)
    #puts "Parsed hashcode : #{parsed.hash}"
    json_str_res = JSON.generate(parsed)
    #puts "Generated: #{json_str_res.hash}"
end

json_str = File.read("benchmark/data/activitypub.json")
#Benchmark.ips do |x|
# x.report("json") { kernel(json_str)} 
#end

warmup_execution_time = Benchmark.measure do
  20000.times { kernel(json_str) }
end
puts "Warmup execution time: #{warmup_execution_time.real}"

execution_time = Benchmark.measure do
  50000.times { kernel(json_str) }
end

puts "Execution time: #{execution_time.real}"
