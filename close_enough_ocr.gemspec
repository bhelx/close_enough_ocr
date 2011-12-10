# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "close_enough_ocr/version"

Gem::Specification.new do |s|
  s.name        = "close_enough_ocr"
  s.version     = CloseEnough::Ocr::VERSION
  s.authors     = ["Benjamin Eckel"]
  s.email       = ["ben@datasingularity.com"]
  s.homepage    = ""
  s.summary     = %q{This is the god damn summary}
  s.description = %q{gems suck}

  s.rubyforge_project = "close_enough_ocr"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_runtime_dependency "rest-client"

  s.add_development_dependency "rspec"
  s.add_dependency "tre-ruby"
end
