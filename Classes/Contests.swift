//
//  Contests.swift
//  Pods-PokemonAPI-Example
//
//  Created by Christopher Jennewein on 6/27/18.
//

import Foundation


/// Contest types are categories judges used to weigh a Pokémon's condition in Pokémon contests. Check out Bulbapedia for greater detail.
open class PKMContestType: Codable, SelfDecodable {
    
    /// The identifier for this contest type resource
    open var id: Int?
    
    /// The name for this contest type resource
    open var name: String?
    
    /// The berry flavor that correlates with this contest type
    open var berryFlavor: PKMNamedAPIResource<PKMBerryFlavor>?
    
    /// The name of this contest type listed in different languages
    open var names: [PKMContestName]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Contest Name
open class PKMContestName: Codable {
    
    /// The localized name for an API resource in a specific language
    open var name: String?
    
    /// The color associated with this contest's name
    open var color: String?
    
    /// The language this name is in
    open var language: PKMNamedAPIResource<PKMLanguage>?
}


/// Contest effects refer to the effects of moves when used in contests.
open class PKMContestEffect: Codable, SelfDecodable {
    
    /// The identifier for this contest type resource
    open var id: Int?
    
    /// The base number of hearts the user of this move gets
    open var appeal: String?
    
    /// The base number of hearts the user's opponent loses
    open var jam: Int?
    
    /// The result of this contest effect listed in different languages
    open var effectEntries: [PKMEffect]?
    
    /// The flavor text of this contest effect listed in different languages
    open var flavorTextEntries: [PKMFlavorText]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Super contest effects refer to the effects of moves when used in super contests.
open class PKMSuperContestEffect: Codable, SelfDecodable {
    
    /// The identifier for this super contest effect resource
    open var id: Int?
    
    /// The level of appeal this super contest effect has
    open var appeal: String?
    
    /// The flavor text of this super contest effect listed in different languages
    open var flavorTextEntries: [PKMFlavorText]?
    
    /// A list of moves that have the effect when used in super contests
    open var moves: [PKMNamedAPIResource<PKMMove>]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Web Services

open class ContestService {
    /**
     Fetch Contest list
     */
    public static func fetchContestList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMContestType {
        let urlStr = baseURL + "/contest-type"
        
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Contest Type Information
     
     - parameter contestTypeId: Contest Type ID
     */
    public static func fetchContestType(_ contestTypeId: Int, completion: @escaping (_ result: Result<PKMContestType, HTTPError>) -> Void) {
        let urlStr = baseURL + "/contest-type/\(contestTypeId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Contest Type Information
     
     - parameter contestTypeName: Contest Type Name
     */
    public static func fetchContestType(_ contestTypeName: String, completion: @escaping (_ result: Result<PKMContestType, HTTPError>) -> Void) {
        let urlStr = baseURL + "/contest-type/\(contestTypeName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Contest Effects list
     */
    public static func fetchContestEffectList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMContestEffect {
        let urlStr = baseURL + "/contest-effect"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Contest Effect Information
     
     - parameter contestEffectId: Contest Effect ID
     */
    public static func fetchContestEffect(_ contestEffectId: Int, completion: @escaping (_ result: Result<PKMContestEffect, HTTPError>) -> Void) {
        let urlStr = baseURL + "/contest-effect/\(contestEffectId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Super Contest Effects list
     */
    public static func fetchSuperContestEffectList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMSuperContestEffect {
        let urlStr = baseURL + "/contest-effect"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Super Contest Effect Information
     
     - parameter superContestEffectId: Super Contest Effect ID
     */
    public static func fetchSuperContestEffect(_ superContestEffectId: Int, completion: @escaping (_ result: Result<PKMSuperContestEffect, HTTPError>) -> Void) {
        let urlStr = baseURL + "/super-contest-effect/\(superContestEffectId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
}
