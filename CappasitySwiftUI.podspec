Pod::Spec.new do |spec|

  spec.cocoapods_version = ">= 1.10.0"
  spec.name         = "CappasitySwiftUI"
  spec.version      = "1.0.2"
  spec.summary      = "Cappasity SwiftUI Framework contains functionality for working with models on the Cappasity platform."

  spec.description  = <<-DESC
  Cappasity SwiftUI Framework contains functionality for working with models on the Cappasity platform, i.e.:

  obtaining the models
  obtaining the properties of a given model
  displaying the model
                   DESC

  spec.homepage     = "https://github.com/CappasityTech/CappasityiOSSwiftUI"

  spec.license      = { :type => "Copyright", :text => "Copyright (c) 2021, Cappasity Inc. All rights reserved.", :file => "LICENSE" }

  spec.author             = "Cappasity"

  spec.platform     = :ios

  spec.source       = { :http => "https://github.com/CappasityTech/CappasityiOSSwiftUI/releases/download/v1.0.2/CappasitySwiftUI.zip" }

  spec.ios.deployment_target = "14.0"
  spec.ios.vendored_frameworks = "CappasitySwiftUI.xcframework"

end
