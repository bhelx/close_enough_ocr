require 'tre-ruby'
require 'close_enough/core_ext/string'

module CloseEnough::Ocr
  module LocationFinder
    class << self
      attr_accessor :locations
    end

    extend self

    def agrep_location(text, fuzziness=2)
      raise "Locations not loaded" unless @locations

      @locations.each do |loc|
        found = text.ascan(loc, TRE.fuziness(fuzziness))
        return found if found
      end
    end

  end
end
