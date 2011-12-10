require 'spec_helper'

describe CloseEnough::Ocr do

  it "should find a location from an image" do
    CloseEnough::Ocr.load_locations! ["Igor's", "Half Moon", "The Saint", "Avenue Pub", "Lucky's", "City Hall"]
    puts CloseEnough::Ocr.locations_from_image(File.join(File.dirname(__FILE__), 'event.gif'))
  end


end


