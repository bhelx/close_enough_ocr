require "close_enough_ocr/version"
require 'close_enough_ocr/image'
require 'close_enough_ocr/location_finder'

module CloseEnough
  module Ocr
    extend self

    def load_locations!(locations)
      locations.sort_by! { |loc| loc.digested_name.length }
      locations.reverse!
      LocationFinder.locations = locations
    end

    def locations_from_image(path, fuzziness=1)
      img = Image.new path
      LocationFinder.agrep_location(img.text, fuzziness)
    end

  end
end
