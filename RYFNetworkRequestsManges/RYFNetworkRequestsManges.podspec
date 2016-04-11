
pod::Spec.new do |s|
  s.name         = "Pod::Spec.new do |s|
  s.name         = "TKit"
  s.version      = "1.0.0"
  s.summary      = "The package of useful tools, include categories and classes"
  s.homepage     = "http://www.brighttj.com"
  s.license      = "MIT"
  s.authors      = { 'tangjr' => 'tangjr.work@gmail.com'}
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/saitjr/TKit.git", :tag => s.version }
  s.source_files = 'TKit'W::"
  s.version      = "1.0.0"
  s.summary      = "The package of useful tools, include categories and classes"
  s.homepage     = "http://www.brighttj.com"
  s.license      = "MIT"
  s.authors      = { 'tangjr' => 'tangjr.work@gmail.com'}
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/saitjr/TKit.git", :tag => s.version }
  s.source_files = 'TKit', 'TKit/**/*.{h,m}'
  s.requires_arc = true
end
