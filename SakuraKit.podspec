Pod::Spec.new do |s|
  s.name         = "SakuraKit"
  s.version      = "0.1.0"
  s.summary      = "SakuraKit is a lightweight and powerful library for application to switching themes or skins, provides chain and functional programming."
  s.homepage     = "https://github.com/tingxins/SakuraKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "tingxins" => "tingxins@sina.com" }
  s.platform     = :ios, "8.0"
  s.source     = { :git => "git@github.com:LiJingBiao/SakuraKit.git", :tag => s.version.to_s   }
  s.source_files  = 'SakuraKit/**/*.{h,m}'
  s.requires_arc = true
  s.dependency "SSZipArchive"
end