
pod::Spec.new do |s|
  s.name         = "RYFNetworkRequestsMangers"
  s.version      = "1.0.0"
  s.summary      = "The fastest and most convenient conversion between JSON and model"
  s.homepage     = "https://github.com/renyufei8023/RYFNetworkRequestsManges"
  s.license      = "MIT"
  s.author             = { "任玉飞" => "872943400@qq.com" }
  s.social_media_url   = "http://weibo.com/ryf8023"
  s.source       = { :git => "https://github.com/renyufei8023/RYFNetworkRequestsManges.git", :tag => s.version }
  s.source_files  = "RYFNetworkRequestsManges/RYFNetworkHttpRequestsManger"
  s.requires_arc = true
end
