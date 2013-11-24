# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chatroom/version'

Gem::Specification.new do |spec|
  spec.name          = "chatroom"
  spec.version       = Chatroom::VERSION
  spec.authors       = ["TsaiKoga"]
  spec.email         = ["969024089@qq.com"]
  spec.description   = %q{This gem can help you create a chatroom.}
  spec.summary       = %q{Chatroom provides functions, like adding emotions or changing text pattern.}
  spec.homepage      = "http://github.com/TsaiKoga/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
	spec.add_development_dependency "faye", "~> 1.0.0"
	spec.add_development_dependency "private_pub", "~> 1.0.3"
	spec.add_development_dependency "thin", "~> 1.5.1"
end
