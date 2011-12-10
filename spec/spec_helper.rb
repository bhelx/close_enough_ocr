require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run 'bundle install' to install missing gems"
  exit e.status_code
end

$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'close_enough_ocr'

CloseEnough::Ocr.load_locations! ["Igor's", "Half Moon", "The Saint", "Avenue Pub", "Lucky's"]

puts CloseEnough::Ocr.locations_from_image(File.join(File.dirname(__FILE__), 'event.jpg'))








