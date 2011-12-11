require 'spec_helper'
require 'ostruct'


describe CloseEnough::Ocr do

  context "" do
    before :all do
      @locations = []
      File.open('spec/location_names.txt', 'r') do |infile|
	gid = 0
        while (line = infile.gets)
          @locations << OpenStruct.new(:name => line.strip, :gid => gid)
          gid += 1
        end
      end

      @locations.sort_by! { |loc| loc.name.length }
      @locations.reverse!
    end

    it "should find a location from an image" do
      CloseEnough::Ocr.load_locations! @locations

      res = CloseEnough::Ocr.locations_from_image(File.join(File.dirname(__FILE__), 'event.jpg'))
      puts "event.jpg -> #{res.first.name} #{res[1].inspect}"
      res.first.name.should == "American University"

      res = CloseEnough::Ocr.locations_from_image(File.join(File.dirname(__FILE__), 'event2.jpg'))
      puts "event2.jpg -> #{res.first.name} #{res[1].inspect}"
      res.first.name.should == "Steamboat Natchez"
    end

  end
end


