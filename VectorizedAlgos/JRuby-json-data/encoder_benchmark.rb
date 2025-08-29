require "benchmark" 
require 'json'

puts "Ruby Engine: #{RUBY_ENGINE}"
puts "JSON::Parser: #{JSON::Parser}"

benchmark_name="twitter.json"
ruby_obj = JSON.load_file("/mnt/c/Github/workloads/VectorAPI/json/benchmark/data/twitter.json")
puts "== Encoding #{benchmark_name}"

hash_accum = 0
def benchmark_coder(benchmark_name, ruby_obj)
  coder = JSON::Coder.new
  json_str = coder.dump(ruby_obj)
  hash_accum = json_str.hash
end

warmup_execution_time = Benchmark.measure do
  10000.times { benchmark_coder("twitter.json", ruby_obj) }
end
puts "Warmup execution time: #{warmup_execution_time.real}"

execution_time = Benchmark.measure do
  20000.times { benchmark_coder("twitter.json", ruby_obj) }
end
puts "Execution time: #{execution_time.real}"
