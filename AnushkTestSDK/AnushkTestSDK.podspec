#
#  Be sure to run `pod spec lint ThreeRingControl.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "AnushkTestSDK"
  s.version      = "1.1"
  s.summary      = "SDK for Recording user interactions"
  s.description  = "TBD"
  s.homepage     = "TBD"

  s.license      = "MIT"
  s.author       = "Anushk Mittal"
  s.platform     = :ios, "13.0"
  
  s.source       = { :path => '.' }
  s.source_files = "AnushkTestSDK", "AnushkTestSDK/**/*.{h,m,swift}"
  s.resources    = "AnushkTestSDK/**/*.xcassets"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5' }
end
