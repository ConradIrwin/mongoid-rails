Gem::Specification.new do |s|
  s.name        = "mongoid-rails"
  s.version     = "4.0.0"
  s.author      = "Conrad Irwin"
  s.email       = "conrad.irwin@gmail.com"
  s.homepage    = "https://github.com/ConradIrwin/mongoid-rails"
  s.summary     = "Strong parameter integration between rails and mongoid"
  s.license     = "MIT"

  s.add_dependency("mongoid", [">= 4.0", "< 7"])

  s.files        = `git ls-files`.split("\n")
  s.require_path = 'lib'
end
