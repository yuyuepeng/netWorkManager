Pod::Spec.new do |s|

  s.name         = "netWorkManager"
  s.version      = "1.0.0"
  s.summary      = "A tool to get data! Support: https://www.jianshu.com/u/2c9b2b3d3814"
  s.homepage     = "https://github.com/yuyuepeng/netWorkManager"
  s.license      = "MIT"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/yuyuepeng/netWorkManager.git", :tag => s.version }
  s.source_files = "Sources/**/*.{h,m}"
  s.requires_arc = true

  s.author       = { "yuyuepeng" => "616250176@qq.com" }

end
