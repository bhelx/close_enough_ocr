# encoding: utf-8

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

      full_text = digest(text)
      @locations.each do |loc|
        found = full_text.ascan(digest(loc.name), TRE.fuzziness(fuzziness))
        return [loc, found] if found.any?
      end
 
      @locations.sort_by! { |loc| loc.name.length }
      @locations.reverse
    end

    private
    
    def digest(text)
      text.downcase.gsub(/[^a-z|\d]/, '')
    end

  end
end
