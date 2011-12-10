require 'tre-ruby'
require 'close_enough_ocr/core_ext/string'

module CloseEnough::Ocr
  module LocationFinder
    class << self
      attr_accessor :locations
    end

    extend self

    def agrep_location(text, fuzziness=1)
      raise "Locations not loaded" unless @locations

      @locations.each do |loc|
        found = text.ascan(loc.downcase, TRE.fuzziness(fuzziness))
        return found if found.any?
      end
    end

  end
end
