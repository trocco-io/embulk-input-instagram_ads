
Gem::Specification.new do |spec|
  spec.name          = "embulk-input-instagram_ads"
  spec.version       = "0.1.0"
  spec.authors       = ["SuperLazyDog"]
  spec.summary       = "Instagram Ads input plugin for Embulk"
  spec.description   = "Loads records from Instagram Ads."
  spec.email         = ["xu.ywwt.a1@gmail.com"]
  spec.licenses      = ["MIT"]
  # TODO set this: spec.homepage      = "https://github.com/jyoitatsu/embulk-input-instagram_ads"

  spec.files         = `git ls-files`.split("\n") + Dir["classpath/*.jar"]
  spec.test_files    = spec.files.grep(%r{^(test|spec)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'embulk', ['>= 0.8.5']
  spec.add_development_dependency 'bundler', ['>= 1.10.6']
  spec.add_development_dependency 'rake', ['>= 10.0']
  spec.add_development_dependency 'koala', ['~> 3.0']
  spec.add_development_dependency 'rspec' # TODO: add test
end
