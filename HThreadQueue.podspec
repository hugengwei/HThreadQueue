Pod::Spec.new do |s|
  s.name         = "HThreadQueue"
  s.version      = "0.0.2"
  s.summary      = "常用线程的简单封装"

  s.homepage     = "https://github.com/hugengwei/HThreadQueue"
  s.license      = "MIT"

  s.author             = { "hugengwei" => "hugengwei1990@163.com" }

  s.ios.deployment_target = "7.0"

  s.source       = { :git => "https://github.com/hugengwei/HThreadQueue.git", :tag => "#{s.version}" }

  s.source_files  = "HThreadQueue", "HThreadQueue/*.{h,m}"
  s.public_header_files = "HThreadQueue/*.h"

  s.requires_arc  = true
  
end
