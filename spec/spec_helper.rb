$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__), "..", "lib"))
require 'timetable'

ENV['RACK_ENV'] = 'test'

RSpec.configure do |c|
  c.color_enabled = true
end