#
# Be sure to run `pod lib lint HiyaWorld.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HiyaWorld'
  s.version          = '0.1.0'
  s.summary          = 'Get all ISO 3166 Countries'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    Get all ISO 3166 Countries API online and saves it offline so it is available without being hard coded in the project.
                       DESC

  s.homepage         = 'https://github.com/nanyoliveira/HiyaWorld'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ariane Clarke' => 'ariane.clarke@hiyacar.co.uk' }
  s.source           = { :git => 'https://github.com/nanyoliveira/HiyaWorld.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/hiyacar'

  s.ios.deployment_target = '13.0'

  s.source_files = 'Sources/HiyaWorld/**/*'
  s.swift_versions = '5.2'
  # s.resource_bundles = {
  #   'HiyaWorld' => ['Sources/Assets/*.png']
  # }

  #s.public_header_files = 'Sources/HiyaWorld/**/*.h'
   s.frameworks = 'Foundation'
    s.dependency 'RealmSwift', '~> 10'
end
