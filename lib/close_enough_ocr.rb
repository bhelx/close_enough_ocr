require "close_enough_ocr/version"
require 'close_enough/image'
require 'close_enough/location_finder'

module CloseEnough
  module Ocr
    extend self

    def load_locations!
      #get locations
      LocationFinder.locations = nil #locations
    end

    def locations_from_image(path)
      img = Image.new path
      LocationFinder.agrep_location(img.process!)
    end

  end
end
