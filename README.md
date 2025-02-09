# PokemonAPI

[![License](https://img.shields.io/cocoapods/l/PokemonAPI.svg?style=flat)](https://github.com/kinkofer/PokemonAPI)
[![Platform](https://img.shields.io/cocoapods/p/PokemonAPI.svg?style=flat)](https://github.com/kinkofer/PokemonAPI)
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

## What is this?

PokemonAPI is a Swift wrapper for PokéAPI (pokeapi.co). Easily call web APIs to get info about Pokemon and the Pokemon games.

```swift
let ditto = try await PokemonAPI().pokemonService.fetchPokemon("ditto") 
```

The framework supports paginated responses, allowing you to quickly get the next results or a specific page. 
Linked resources can quickly be turned into their associated classes via a generic `fetch(_ resource:)` function.

All code is Swift native with no third party frameworks. Supports Swift 6 concurrancy with Sendable structs.



## Usage

Use the `PokemonAPI` class to access web API classes organized by categories found on pokeapi.co (Berries, Pokemon, Games, etc.).

### Response

All web API functions support the async/await pattern (iOS 15, macOS 12, watchOS 8, tvOS 15). Success values contain a Sendable struct decoded from the JSON response. The thrown exception is a custom Error enum type `HTTPError`.

### Resources

Some properties on the returned object are type `PKMAPIResource<T>` where generic `T` is another class with additional information. Passing that property to `PokemonAPI.resourceService.fetch(_ resource:)` will return that underlying class. An example is provided below.

### Lists

Fetching lists will return a `PagedObject<T>` containing a page of results, plus the total count, number of pages, and if next and/or previous pages are available. The `results` will be an array of `PKMAPIResource<T>`, so it's typical to fetch the resources immediately, if needed.

Web API functions for lists take a `PaginationState` enum parameter. There are two cases for this enum, `.initial(pageLimit: Int)` for the first call, and `.continuing(PKMPagedObject<T>, PaginationRelationship)` for subsequent calls. Each function sets a default value of `.initial(pageLimit: 20)`, but you can pass your own page limit. After the first call, you use `.continuing()` with the PagedObject from the last response, and a `PaginationRelationship` for navigation (`.next`, `.previous`, `.first`, `.last`, or a specific `.page(Int)`).

The example project included in this framework contains a full example for working with lists.

### Network Calls

Allow your app to make calls to PokéAPI (pokeapi.co) by enabling "Outgoing Connections (Client)" in your project's Signing & Capabilities.


## Examples

```swift
import PokemonAPI

let pokemonAPI = PokemonAPI()

do {
	// Example of calling a web API using an ID
	let berry = try await pokemonAPI.berryService.fetchBerry(1)
	print(berry.name!) // cheri
	
	// Example of calling a web API using a name
	let pokemon = try await pokemonAPI.pokemonService.fetchPokemon("bulbasaur") 
	print(pokemon.name!) // bulbasaur
}
catch {
    print(error.localizedDescription)
}
```


```swift
// Example of fetching a PKMAPIResource
do {
    let pokedex = try await pokemonAPI.gameService.fetchPokedex(14)
    print(pokedex.name!) // kalos-mountain
    let region = try await pokemonAPI.resourceService.fetch(pokedex.region!)
    print(region.name!) // kalos
}
catch {
    print(error.localizedDescription)
}
```

```swift
// Example of calling a paginated web service with a pageLimit, then using the pagedObject to fetch the next page in the list
do {
    let pagedLanguages = try await pokemonAPI.utilityService.fetchLanguageList(paginationState: .initial(pageLimit: 5))
    print("Total: \(pagedLanguages.count!)") // Total: 13
    let pagedLanguagesNext = try await pokemonAPI.utilityService.fetchLanguageList(paginationState: .continuing(pagedLanguages, .next))
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

## Author

Christopher Jennewein, kinkofer@gmail.com

Forked from PokemonKit, Yeung Yiu Hung, http://github.com/ContinuousLearning/PokemonKit

## License

PokemonAPI is available under the MIT license. See the LICENSE file for more info.

