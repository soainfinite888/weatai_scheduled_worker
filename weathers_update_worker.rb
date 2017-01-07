# frozen_string_literal: true
require 'ostruct'
require 'http'
require 'yaml'

## Scheduled worker regularly runs updates using queued URLs
# e.g.: {"url":"https://localhost:9292/api/v0.1/group/1/update"}
class UpdateWorker

  def self.call
    puts "UPDATING..."
    HTTP.post('http://weataiapi.herokuapp.com/api/v0.1/weather')
  end
end

begin
  UpdateWorker.call
  puts 'STATUS: SUCCESS'
rescue => e
  puts "STATUS: ERROR (#{e.inspect})"
end
