# PokemonAPI

[![Build Status](https://travis-ci.org/ContinuousLearning/PokemonKit.svg?branch=master)](https://travis-ci.org/ContinuousLearning/PokemonKit)
[![Version](https://img.shields.io/cocoapods/v/PokemonKit.svg?style=flat)](http://cocoapods.org/pods/PokemonKit)
[![License](https://img.shields.io/cocoapods/l/PokemonKit.svg?style=flat)](http://cocoapods.org/pods/PokemonKit)
[![Platform](https://img.shields.io/cocoapods/p/PokemonKit.svg?style=flat)](http://cocoapods.org/pods/PokemonKit)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## What is this?

PokemonAPI is a swift wrapper for pokeapi.co



## Usage

```swift
import PokemonAPI

PokemonAPI.berryService.fetchBerry("1") { result in
    switch result {
    case .success(let berryInfo):
        self.testLabel.text = berryInfo.name
    case .failure(let error):
        print(error)
    }
}
```

## TODO

- [ ] Fully [Documented](http://continuouslearning.github.io/PokemonKit/)
- [ ] Fully tested

## Installation

PokemonAPI is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PokemonAPI'
```

If you're using Carthage you can add PokemonKit by adding it to your Cartfile:

```ruby
github "kinkofer/PokemonAPI" ~> 3.0
```

In your Info.plist, add
```plist
<key>NSAppTransportSecurity</key>
<dict>
	<key>NSExceptionDomains</key>
	<dict>
		<key>pokeapi.co</key>
		<dict>
			<key>NSIncludesSubdomains</key>
			<true/>
			<key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
			<true/>
			<key>NSTemporaryExceptionMinimumTLSVersion</key>
			<string>TLSv1.1</string>
		</dict>
	</dict>
</dict>
```

## Author

Christopher Jennewein, kinkofer@gmail.com
Orginal author from PokemonKit, Yeung Yiu Hung, hkclex@gmail.com

## License

PokemonAPI is available under the MIT license. See the LICENSE file for more info.

