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

      full_text = text.downcase
      @locations.each do |loc|
        found = full_text.ascan(loc.name.downcase, TRE.fuzziness(fuzziness))
        return [loc, found] if found.any?
      end
 
      @locations.sort_by! { |loc| loc.name.length }
      @locations.reverse
    end

  end
end
