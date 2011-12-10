require 'spec_helper'

describe CloseEnough::Ocr do

  context "" do
    
    it "should find a location from an image" do
      CloseEnough::Ocr.load_locations! ["Igor's", "Half Moon", "The Saint", "Avenue Pub", "Lucky's", "City Hall", "American University", "London Central Library"]

      res = CloseEnough::Ocr.locations_from_image(File.join(File.dirname(__FILE__), 'event.jpg'))
      res.first.should == "American University"
      puts "event.jpg -> #{res.first}"

    end

  end
end


