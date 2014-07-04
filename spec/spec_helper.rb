require 'safety_check'

Dir["#{File.dirname(__FILE__)}/test_models/*.rb"].sort.each do |path|
  require "test_models/#{File.basename(path, '.rb')}"
end
