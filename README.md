# PokemonAPI

[![Build Status](https://travis-ci.org/kinkofer/PokemonAPI.svg?branch=master)](https://travis-ci.org/kinkofer/PokemonAPI)
[![License](https://img.shields.io/cocoapods/l/PokemonAPI.svg?style=flat)](http://cocoapods.org/pods/PokemonAPI)
[![Platform](https://img.shields.io/cocoapods/p/PokemonAPI.svg?style=flat)](http://cocoapods.org/pods/PokemonAPI)
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Version](https://img.shields.io/cocoapods/v/PokemonAPI.svg?style=flat)](http://cocoapods.org/pods/PokemonAPI)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## What is this?

PokemonAPI is a Swift wrapper for PokéAPI (pokeapi.co). Easily call web APIs to get info about Pokemon and the Pokemon games.

The framework supports paginated responses, allowing you to quickly get the next results or a specific page. 
Linked resources can quickly be turned into their associated classes via a generic `fetch(_ resource:)` function.

All code is Swift native with no third party frameworks.



## Usage

Use the `PokemonAPI` class to access web API classes organized by categories found on pokeapi.co (Berries, Pokemon, Games, etc.).

### Response
All web API functions are duplicated to support three methods of receiving the response:

- Escaping closures (completion handlers) with type `Result`
- Publishers, for compatibility with the Combine framework (iOS 13, macOS 10.15, watchOS 6, tvOS 13) 
- Async functions to support the async/await pattern (iOS 15, macOS 12, watchOS 8, tvOS 15)

Success values from these functions contain a custom class decoded from the JSON response. The error value is custom enum type `HTTPError`.

### Resources

Some properties on the returned object are type `PKMNamedAPIResource<T>` or `PKMAPIResource<T>` where generic `T` is another class with additional information. Passing that property to `PokemonAPI.resourceService.fetch(_ resource:)` will return that underlying class. An example is provided below.

### Lists

Fetching lists will return a `PagedObject<T>` containing a page of results, plus the total count, number of pages, and if next and/or previous pages are available. The `results` will be an array of `PKMNamedAPIResource<T>` or `PKMAPIResource<T>`, so it's typical to fetch the resources immediately, if needed.

Web API functions for lists take a `PaginationState` enum parameter. There are two cases for this enum, `.initial(pageLimit: Int)` for the first call, and `.continuing(PKMPagedObject<T>, PaginationRelationship)` for subsequent calls. Each function sets a default value of `.initial(pageLimit: 20)`, but you can pass your own page limit. After the first call, you use `.continuing()` with the PagedObject from the last response, and a `PaginationRelationship` for navigation (`.next`, `.previous`, `.first`, `.last`, or a specific `.page(Int)`).

The example project included in this framework contains a full example for working with lists.

### Network Calls

Allow your app to make calls to PokéAPI (pokeapi.co) by making an App Transport Security domain exception.

In your Info.plist, add
```
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


## Examples

```swift
import PokemonAPI

// Example of calling a web API using an ID
PokemonAPI().berryService.fetchBerry(1) { result in
    switch result {
    case .success(let berry):
        self.berryLabel.text = berry.name // cheri
    case .failure(let error):
        print(error.localizedDescription)
    }
}

// Same example using Combine. Don't forget to store your cancellable.
let cancellable = PokemonAPI().berryService.fetchBerry(1)
	.sink(receiveCompletion: { completion in
        if case .failure(let error) = completion {
            print(error.localizedDescription)
        }
	}, receiveValue: { berry in
		self.berryLabel.text = berry.name // cheri
	})

// Same example using async/await.
do {
    self.berryLabel.text = try await PokemonAPI().berryService.fetchBerry(1)
}
catch {
    print(error.localizedDescription)
}
```


```swift
// Example of calling a web API using a name
PokemonAPI().pokemonService.fetchPokemon("bulbasaur") { result in
    switch result {
    case .success(let pokemon):
        self.pokemonLabel.text = pokemon.name // bulbasaur
    case .failure(let error):
        print(error.localizedDescription)
    }
}
```


```swift
// Example of fetching a PKMNamedAPIResource (or PKMAPIResource)
PokemonAPI().gameService.fetchPokedex(14) { result in
    switch result {
    case .success(let pokedex):
        print(pokedex.name!) // kalos-mountain
        
        PokemonAPI().resourceService.fetch(pokedex.region!) { result in
            switch result {
            case .success(let region):
                print(region.name!) // kalos
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    case .failure(let error):
        print(error.localizedDescription)
    }
}

// Same example using async/await
do {
    let pokedex = try await PokemonAPI().gameService.fetchPokedex(14)
    print(pokedex.name!) // kalos-mountain
    let region = try await PokemonAPI().resourceService.fetch(pokedex.region!)
    print(region.name!) // kalos
}
catch {
    print(error.localizedDescription)
}
```

```swift
// Example of calling a paginated web service with a pageLimit, then using the pagedObject to fetch the next page in the list
PokemonAPI().utilityService.fetchLanguageList(paginationState: .initial(pageLimit: 5)) { result in
    switch result {
    case .success(let pagedLanguages):
        print("Total: \(pagedLanguages.count!)") // Total: 13

        PokemonAPI().utilityService.fetchLanguageList(paginationState: .continuing(pagedLanguages, .next)) { result in
            switch result {
            case .success(let pagedLanguagesNext):
                print("Page: \(pagedLanguagesNext.currentPage)") // Page: 1
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    case .failure(let error):
        print(error.localizedDescription)
    }
}

// Same example using async/await
do {
    let pagedLanguages = try await PokemonAPI().utilityService.fetchLanguageList(paginationState: .initial(pageLimit: 5))
    print("Total: \(pagedLanguages.count!)") // Total: 13
    let pagedLanguagesNext = try await PokemonAPI().utilityService.fetchLanguageList(paginationState: .continuing(pagedLanguages, .next))
    print("Page: \(pagedLanguagesNext.currentPage)") // Page: 1
}
catch {
    print(error.localizedDescription)
}
```


## TODO

- [ ] Fully [Documented](http://kinkofer.github.io/PokemonAPI/)
- [ ] Fully tested

## Installation

### Swift Package Manager

Search for this repository URL in Xcode:

File->Swift Packages->Add Package Dependency...

```
https://github.com/kinkofer/PokemonAPI
```

### Cocoapods

PokemonAPI is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PokemonAPI'
```


### Carthage

If you're using Carthage you can add PokemonAPI by adding it to your Cartfile:

```ruby
github "kinkofer/PokemonAPI" ~> 6.1.0
```

## Author

Christopher Jennewein, kinkofer@gmail.com

Forked from PokemonKit, Yeung Yiu Hung, http://github.com/ContinuousLearning/PokemonKit

## License

PokemonAPI is available under the MIT license. See the LICENSE file for more info.

