Pod::Spec.new do |s|
  s.name         = "HThreadQueue"
  s.version      = "0.0.1"
  s.summary      = "常用线程的简单封装"
  s.description  = <<-DESC
                    多线程的简单封装
                   DESC

  s.homepage     = "https://github.com/hugengwei/HThreadQueue"
  s.license      = "MIT"

  s.author             = { "hugengwei" => "hugengwei1990@163.com" }

  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"

  s.source       = { :git => "https://github.com/hugengwei/HThreadQueue.git", :tag => "#{s.version}" }

  s.source_files  = "HThreadQueue", "HThreadQueue/*.{h,m}"
  s.public_header_files = "HThreadQueue/*.h"
end
