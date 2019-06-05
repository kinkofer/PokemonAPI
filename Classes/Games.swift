//
//  Games.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/27/18.
//

import Foundation



/// A generation is a grouping of the Pokémon games that separates them based on the Pokémon they include. In each generation, a new set of Pokémon, Moves, Abilities and Types that did not exist in the previous generation are released.
open class PKMGeneration: Codable, SelfDecodable {
    
    /// The identifier for this generation resource
    open var id: Int?
    
    /// The name for this generation resource
    open var name: String?
    
    /// The name of this generation listed in different languages
    open var names: [PKMName]?
    
    /// A list of abilities that were introduced in this generation
    open var abilities: [PKMNamedAPIResource<PKMAbility>]?
    
    /// The main region travelled in this generation
    open var mainRegion: PKMNamedAPIResource<PKMRegion>?
    
    /// A list of moves that were introduced in this generation
    open var moves: [PKMNamedAPIResource<PKMMove>]?
    
    /// A list of Pokémon species that were introduced in this generation
    open var pokemonSpecies: [PKMNamedAPIResource<PKMPokemonSpecies>]?
    
    /// A list of types that were introduced in this generation
    open var types: [PKMNamedAPIResource<PKMType>]?
    
    /// A list of version groups that were introduced in this generation
    open var versionGroups: [PKMNamedAPIResource<PKMVersionGroup>]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// A Pokédex is a handheld electronic encyclopedia device; one which is capable of recording and retaining information of the various Pokémon in a given region with the exception of the national dex and some smaller dexes related to portions of a region. See Bulbapedia for greater detail.
open class PKMPokedex: Codable, SelfDecodable {
    
    /// The identifier for this Pokédex resource
    open var id: Int?
    
    /// The name for this Pokédex resource
    open var name: String?
    
    /// Whether or not this Pokédex originated in the main series of the video games
    open var isMainSeries: Bool?
    
    /// The description of this Pokédex listed in different languages
    open var descriptions: [PKMDescription]?
    
    /// The name of this Pokédex listed in different languages
    open var names: [PKMName]?
    
    /// A list of pokemon catalogued in this Pokédex and their indexes
    open var pokemonEntries: [PKMPokemonEntry]?
    
    /// The region this Pokédex catalogues pokemon for
    open var region: PKMNamedAPIResource<PKMRegion>?
    
    /// A list of version groups this Pokédex is relevent to
    open var versionGroups: [PKMNamedAPIResource<PKMVersionGroup>]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Entry
open class PKMPokemonEntry: Codable, SelfDecodable {
    
    /// The index of this pokemon species entry within the Pokédex
    open var entryNumber: Int?
    
    /// The Pokémon species being encountered
    open var pokemonSpecies: PKMNamedAPIResource<PKMPokemonSpecies>?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Versions of the games, e.g., Red, Blue or Yellow.
open class PKMVersion: Codable, SelfDecodable {
    
    /// The identifier for this version resource
    open var id: Int?
    
    /// The name for this version resource
    open var name: String?
    
    /// The name of this version listed in different languages
    open var names: [PKMName]?
    
    /// The version group this version belongs to
    open var versionGroup: PKMNamedAPIResource<PKMVersion>?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Version groups categorize highly similar versions of the games.
open class PKMVersionGroup: Codable, SelfDecodable {
    
    /// The identifier for this version group resource
    open var id: Int?
    
    /// The name for this version group resource
    open var name: String?
    
    /// Order for sorting. Almost by date of release, except similar versions are grouped together.
    open var order: Int?
    
    /// The generation this version was introduced in
    open var generation: PKMNamedAPIResource<PKMGeneration>?
    
    /// A list of methods in which Pokémon can learn moves in this version group
    open var moveLearnMethods: [PKMNamedAPIResource<PKMMoveLearnMethod>]?
    
    /// The name of this version group listed in different languages
    open var names: [PKMName]?
    
    /// A list of Pokédexes introduces in this version group
    open var pokedexes: [PKMNamedAPIResource<PKMPokedex>]?
    
    /// A list of regions that can be visited in this version group    list
    open var regions: [PKMNamedAPIResource<PKMRegion>]?
    
    /// The versions this version group owns
    open var versions: [PKMNamedAPIResource<PKMVersion>]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Web Services

open class GameService {
    /**
     Fetch Generations list
     */
    public static func fetchGenerationList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMGeneration {
        let urlStr = baseURL + "/generation"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Generation Information
     
     - parameter generationId: Generation ID
     */
    public static func fetchGeneration(_ generationId: Int, completion: @escaping (_ result: Result<PKMGeneration, HTTPError>) -> Void) {
        let urlStr = baseURL + "/generation/\(generationId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Generation Information
     
     - parameter generationName: Generation Name
     */
    public static func fetchGeneration(_ generationName: String, completion: @escaping (_ result: Result<PKMGeneration, HTTPError>) -> Void) {
        let urlStr = baseURL + "/generation/\(generationName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokedex list
     */
    public static func fetchPokedexList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMPokedex {
        let urlStr = baseURL + "/pokedex"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Pokedex Information
     
     - parameter pokedexId: Pokedex ID
     */
    public static func fetchPokedex(_ pokedexId: Int, completion: @escaping (_ result: Result<PKMPokedex, HTTPError>) -> Void) {
        let urlStr = baseURL + "/pokedex/\(pokedexId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokedex Information
     
     - parameter pokedexName: Pokedex Name
     */
    public static func fetchPokedex(_ pokedexName: String, completion: @escaping (_ result: Result<PKMPokedex, HTTPError>) -> Void) {
        let urlStr = baseURL + "/pokedex/\(pokedexName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Versions list
     */
    public static func fetchVersionList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMVersion {
        let urlStr = baseURL + "/version"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Version Information
     
     - parameter versionId: Version ID
     */
    public static func fetchVersion(_ versionId: Int, completion: @escaping (_ result: Result<PKMVersion, HTTPError>) -> Void) {
        let urlStr = baseURL + "/version/\(versionId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Version Information
     
     - parameter versionName: Version Name
     */
    public static func fetchVersion(_ versionName: String, completion: @escaping (_ result: Result<PKMVersion, HTTPError>) -> Void) {
        let urlStr = baseURL + "/version/\(versionName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Versions Groups list
     */
    public static func fetchVersionGroupList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMVersionGroup {
        let urlStr = baseURL + "/version-group"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Version Group Information
     
     - parameter versionGroupId: Version Group ID
     */
    public static func fetchVersionGroup(_ versionGroupId: Int, completion: @escaping (_ result: Result<PKMVersionGroup, HTTPError>) -> Void) {
        let urlStr = baseURL + "/version-group/\(versionGroupId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Version Group Information
     
     - parameter versionGroupName: Version Group Name
     */
    public static func fetchVersionGroup(_ versionGroupName: String, completion: @escaping (_ result: Result<PKMVersionGroup, HTTPError>) -> Void) {
        let urlStr = baseURL + "/version-group/\(versionGroupName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
}
