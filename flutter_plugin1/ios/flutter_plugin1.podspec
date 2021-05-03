#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_plugin1.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_plugin1'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin.'
  s.description      = <<-DESC
A new Flutter plugin.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*.{h,m}'
  s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'Photos','SystemConfiguration','CoreText','QuartzCore','CoreMotion'
  s.ios.vendored_frameworks = 'Frameworks/*.framework'
  s.vendored_frameworks = 'Frameworks/*.framework'
  s.libraries = 'c++','z'
  s.vendored_libraries = 'Classes/**/*.a'
#  s.dependency 'AFNetworking', '~> 2.3'
#  s.dependency 'MBProgressHUD'
#  s.dependency 'FLAnimatedImage', '~> 1.0.12'
#  s.dependency 'Masonry'
#  s.dependency 'SobotKit'
#  s.dependency 'AlipaySDK-iOS'
#  s.dependency 'SDWebImage'
#  s.dependency 'SDCycleScrollView','~> 1.61'

  s.resources = ['Assets/Assets.xcassets','Classes/**/*.xib','Classes/**/*.jpg','Classes/**/*.gif','Classes/**/*.jpg','Classes/**/*.png','Classes/**/*.json','Classes/*.storyboard','Classes/**/*.pch']
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'
#  valid_archs = ['arm64','arm64e','armv7','armv7s']
#  s.xcconfig = {
#   'VALID_ARCHS' =>  valid_archs.join(' '),
#  }
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
