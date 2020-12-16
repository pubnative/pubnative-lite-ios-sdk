Pod::Spec.new do |s|
  s.name         = "HyBid"
  s.version      = "2.3.0-beta"
  s.summary      = "This is the iOS SDK of HyBid. You can read more about it at https://pubnative.net."
  s.description = <<-DESC
                     HyBid leverages first-look prebid technology to maximize yield for the publishers across
                     their current monetization suit. Access to the unique demand across different formats allows
                     publishers to immediately benefit with additional revenues on top of their current yield. Prebid technology
                     allows getting a competitive bid before executing your regular waterfall logic, and then
                     participate in the relevant auctions in the cascade.
                   DESC
  s.homepage     = "https://github.com/pubnative/pubnative-hybid-ios-sdk"
  s.documentation_url = "https://developers.pubnative.net/v3.0/docs/hybid"
  s.license             = { :type => "MIT", :text => <<-LICENSE
    MIT License

    Copyright (c) 2020 PubNative GmbH

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
      LICENSE
    }

  s.authors      = { "Can Soykarafakili" => "can.soykarafakili@pubnative.net", "Eros Garcia Ponte" => "eros.ponte@pubnative.net", "Fares Benhamouda" => "fares.benhamouda@pubnative.net", "Orkhan Alizada" => "orkhan.alizada@pubnative.net"  }
  s.platform     = :ios
  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/pubnative/pubnative-hybid-ios-sdk.git", :branch => "development-hybid-modules" }
  
  s.default_subspecs = 'HyBid'

  s.subspec 'HyBid' do |sdk|
    sdk.dependency 'HyBid/Core'
    sdk.dependency 'HyBid/Banner'
  end
  
  s.subspec 'Core' do |core|
    core.source_files          = 'PubnativeLite/PubnativeLite/Core/**/*.{swift,h,m}'
    core.resource_bundles             = {'HyBidResources' => ['PubnativeLite/PubnativeLite/Resources/**/*', 'PubnativeLite/PubnativeLite/OMSDK-1.3.7/*.js', 'PubnativeLite/PubnativeLite/Core/MRAID/*.js']}
    core.exclude_files         = 'PubnativeLite/PubnativeLite/Core/HyBidStatic.{swift,h,m}'
    core.vendored_frameworks   = ['PubnativeLite/PubnativeLite/OMSDK-1.3.7/*.{framework}']
  end
  
  s.subspec 'Banner' do |banner|
    banner.dependency           'HyBid/Core'
    banner.source_files         = ['PubnativeLite/Banner/**/*.{swift,h,m}']
  end
  
end
