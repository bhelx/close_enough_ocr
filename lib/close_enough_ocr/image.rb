require 'tesseract'

#Tesseract::DependencyChecker.check!

module CloseEnough::Ocr
  class Image
    attr_accessor :file_path, :text

    def initialize(path)
      @file_path = path
      process!
    end

    def process!
      ts = Tesseract::Process.new(@file_path)
      @text = ts.results
    end

  end
end
