#
# Be sure to run `pod lib lint PokemonAPI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PokemonAPI"
  s.version          = "5.0.0"
  s.summary          = "A wrapper for pokeapi v2"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
  PokemonAPI is a swift wrapper for PokéAPI (pokeapi.co).
  Easily call web services to get info about Pokemon and the Pokemon games.
  The framework supports paginated responses, allowing you to quickly get the next results or a specific page.
  Linked resources can quickly be turned into their associated classes via a generic `fetch(_ resource:)` function.
  All code is Swift native with no third party frameworks.
                       DESC

  s.homepage         = "https://github.com/kinkofer/PokemonAPI"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Christopher Jennewein" => "kinkofer@gmail.com" }
  s.source           = { :git => "https://github.com/kinkofer/PokemonAPI.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/kinkofer'

  s.ios.deployment_target = '9.3'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '9.2'
  s.watchos.deployment_target = '2.2'

  s.swift_version = '5.0'

  s.requires_arc = true

  s.source_files = 'PokemonAPI/Classes/**/*', 'PokemonAPI/Network/**/*', 'PokemonAPI/Utilities/**/*', 'PokemonAPI/WebServices/**/*'
end
