#!/usr/bin/env ruby
# coding: utf-8

require 'open3'
require 'sqlite3'
require 'date'

COMMAND = '/usr/local/bin/speedtest-cli --simple'

output = ''

Open3.popen3(COMMAND) do |_stdin, stdout, _stderr, _wait_thr|
  output = stdout.read
end

begin
  db = SQLite3::Database.new("#{File.expand_path(File.dirname(__FILE__))}/speed_test.db")
  db.execute "CREATE TABLE IF NOT EXISTS Speed_Tests(id INTEGER PRIMARY KEY, date NUMERIC, ping REAL, upload REAL, download REAL)"
  db.execute "INSERT INTO Speed_Tests(date, ping, upload, download) VALUES ('#{DateTime.now}', '#{output.split[1]}', '#{output.split[4]}', '#{output.split[7]}')"
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
ensure
  db.close if db
end
