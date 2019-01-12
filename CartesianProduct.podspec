Pod::Spec.new do |spec|
  spec.name         = "CartesianProduct"
  spec.version      = "0.0.1"
  spec.summary      = "Swift lazy cartesian product generator"
  spec.homepage     = "https://github.com/felginep/CartesianProduct"
  spec.license      = { :type => "MIT" }
  spec.author       = "Pierre Felgines"
  spec.social_media_url   = "https://twitter.com/PierreFelgines"
  spec.source       = { :git => "https://github.com/felginep/CartesianProduct.git", :tag => 'v0.0.1' }
  spec.source_files  = "Sources/**/*.swift"
  spec.swift_version = '4.2'
  spec.ios.deployment_target  = '9.0'
  spec.osx.deployment_target  = '10.10'
end
