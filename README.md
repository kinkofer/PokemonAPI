# PokemonAPI

[![Build Status](https://travis-ci.org/kinkofer/PokemonAPI.svg?branch=master)](https://travis-ci.org/kinkofer/PokemonAPI)
[![Version](https://img.shields.io/cocoapods/v/PokemonAPI.svg?style=flat)](http://cocoapods.org/pods/PokemonAPI)
[![License](https://img.shields.io/cocoapods/l/PokemonAPI.svg?style=flat)](http://cocoapods.org/pods/PokemonAPI)
[![Platform](https://img.shields.io/cocoapods/p/PokemonAPI.svg?style=flat)](http://cocoapods.org/pods/PokemonAPI)
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

- [ ] Fully [Documented](http://kinkofer.github.io/PokemonAPI/)
- [ ] Fully tested

## Installation

PokemonAPI is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PokemonAPI'
```

If you're using Carthage you can add PokemonAPI by adding it to your Cartfile:

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
			<string>TLSv1.2</string>
		</dict>
	</dict>
</dict>
```

## Author

Christopher Jennewein, kinkofer@gmail.com

Forked from PokemonKit, Yeung Yiu Hung, http://github.com/ContinuousLearning/PokemonKit

## License

PokemonAPI is available under the MIT license. See the LICENSE file for more info.

