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
        return found if found = text.ascan(loc, TRE.fuziness(fuzziness))
      end
    end

  end
end
