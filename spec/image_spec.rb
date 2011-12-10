require 'spec_helper'
require 'ostruct'

LOCATION_NAMES = [
  "Igor's",
  "Half Moon",
  "The Saint",
  "Avenue Pub",
  "Lucky's",
  "City Hall",
  "American University",
  "London Central Library",
  "Mardi Gras World"
]


describe CloseEnough::Ocr do

  context "" do
    before :each do
      @locations = []
      LOCATION_NAMES.each_with_index do |n, i|
        @locations << OpenStruct.new(:name => n, :gid => i)
      end
    end

    
    it "should find a location from an image" do
      CloseEnough::Ocr.load_locations! @locations

      res = CloseEnough::Ocr.locations_from_image(File.join(File.dirname(__FILE__), 'event.jpg'))
      res.first.name.should == "American University"
      puts "event.jpg -> #{res.first.name}"

      res = CloseEnough::Ocr.locations_from_image(File.join(File.dirname(__FILE__), 'event2.jpg'))
      res.first.name.should == "Mardi Gras World"
      puts "event2.jpg -> #{res.first.name}"
    end

  end
end


