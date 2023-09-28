project 'ASwiftUIExample.xcodeproj'
platform :ios, '12.0'
use_frameworks!

target 'SwiftUIExample' do
    project 'SwiftUIExample.xcodeproj'
    pod 'AliceOnboarding'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == "Alamofire" || target.name ==  "Yams"
      target.build_configurations.each do |config|
        config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      end
    end
    
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '5.0'
      if config.name == 'Debug' && defined?(target.product_type) && target.product_type == "com.apple.product-type.framework"
        config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'YES'
      end
    end
    
  end
end
