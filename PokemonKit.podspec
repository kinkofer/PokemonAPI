#
# Be sure to run `pod lib lint PokemonKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PokemonKit"
  s.version          = "2.0.1"
  s.summary          = "A wrapper for pokeapi v2"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
PokemonKit is a swift wrapper for Pokeapi.
PokemonKit use Alamofire web requests handling.
                       DESC

  s.homepage         = "https://github.com/ContinuousLearning/PokemonKit"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Yeung Yiu Hung" => "hkclex@gmail.com" }
  s.source           = { :git => "https://github.com/ContinuousLearning/PokemonKit.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/darkcl_dev'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.requires_arc = true

  s.source_files = 'Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end
