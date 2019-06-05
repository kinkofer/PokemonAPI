//
//  Moves.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/27/18.
//

import Foundation


/// Moves are the skills of Pokémon in battle. In battle, a Pokémon uses one move each turn. Some moves (including those learned by Hidden Machine) can be used outside of battle as well, usually for the purpose of removing obstacles or exploring new areas.
open class PKMMove: Codable, SelfDecodable {
    
    /// The identifier for this move resource
    open var id: Int?
    
    /// The name for this move resource
    open var name: String?
    
    /// The percent value of how likely this move is to be successful
    open var accuracy: Int?
    
    /// The percent value of how likely it is this moves effect will happen
    open var effectChance: Int?
    
    /// Power points. The number of times this move can be used
    open var pp: Int?
    
    /// A value between -8 and 8. Sets the order in which moves are executed during battle. See Bulbapedia for greater detail.
    open var priority: Int?
    
    /// The base power of this move with a value of 0 if it does not have a base power
    open var power: Int?
    
    /// A detail of normal and super contest combos that require this move
    open var contestCombos: PKMContestComboSets?
    
    /// The type of appeal this move gives a Pokémon when used in a contest
    open var contestType: PKMNamedAPIResource<PKMContestType>?
    
    /// The effect the move has when used in a contest
    open var contestEffect: PKMAPIResource<PKMContestEffect>?
    
    /// The type of damage the move inflicts on the target, e.g. physical
    open var damageClass: PKMNamedAPIResource<PKMMoveDamageClass>?
    
    /// The effect of this move listed in different languages
    open var effectEntries: [PKMVerboseEffect]?
    
    /// The list of previous effects this move has had across version groups of the games
    open var effectChanges: [PKMAbilityEffectChange]?
    
    /// The flavor text of this move listed in different languages
    open var flavorTextEntries: [PKMMoveFlavorText]?
    
    /// The generation in which this move was introduced
    open var generation: PKMNamedAPIResource<PKMGeneration>?
    
    /// A list of the machines that teach this move
    open var machines: [PKMMachineVersionDetail]?
    
    /// Metadata about this move
    open var meta: PKMMoveMetaData?
    
    /// The name of this move listed in different languages
    open var names: [PKMName]?
    
    /// A list of move resource value changes across ersion groups of the game
    open var pastValues: [PKMPastMoveStatValues]?
    
    /// A list of stats this moves effects and how much it effects them
    open var statChanges: [PKMMoveStatChange]?
    
    /// The effect the move has when used in a super contest
    open var superContestEffect: PKMAPIResource<PKMSuperContestEffect>?
    
    /// The type of target that will recieve the effects of the attack
    open var target: PKMNamedAPIResource<PKMMoveTarget>?
    
    /// The elemental type of this move    NamedAPIResource
    open var type: PKMNamedAPIResource<PKMType>?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Contest Combo Sets
open class PKMContestComboSets: Codable {
    
    /// A detail of moves this move can be used before or after, granting additional appeal points in contests
    open var normal: PKMContestComboDetail?
    
    /// A detail of moves this move can be used before or after, granting additional appeal points in super contests
    open var `super`: PKMContestComboDetail?
}


/// Contest Combo Detail
open class PKMContestComboDetail: Codable, SelfDecodable {
    
    /// A list of moves to use before this move
    open var useBefore: [PKMNamedAPIResource<PKMMove>]?
    
    /// A list of moves to use after this move
    open var useAfter: [PKMNamedAPIResource<PKMMove>]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Move Flavor Text
open class PKMMoveFlavorText: Codable, SelfDecodable {
    
    /// The localized flavor text for an api resource in a specific language
    open var flavorText: String?
    
    /// The language this name is in
    open var language: PKMNamedAPIResource<PKMLanguage>?
    
    /// The version group that uses this flavor text
    open var versionGroup: PKMNamedAPIResource<PKMVersion>?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Move Meta Data
open class PKMMoveMetaData: Codable, SelfDecodable {
    
    /// The status ailment this move inflicts on its target
    open var ailment: PKMNamedAPIResource<PKMMoveAilment>?
    
    /// The category of move this move falls under, e.g. damage or ailment
    open var category: PKMNamedAPIResource<PKMMove>?
    
    /// The minimum number of times this move hits. Null if it always only hits once.
    open var minHits: Int?
    
    /// The maximum number of times this move hits. Null if it always only hits once.
    open var maxHits: Int?
    
    /// The minimum number of turns this move continues to take effect. Null if it always only lasts one turn.
    open var minTurns: Int?
    
    /// The maximum number of turns this move continues to take effect. Null if it always only lasts one turn.
    open var maxTurns: Int?
    
    /// HP drain (if positive) or Recoil damage (if negative), in percent of damage done
    open var drain: Int?
    
    /// The amount of hp gained by the attacking pokemon, in percent of it's maximum HP
    open var healing: Int?
    
    /// Critical hit rate bonus
    open var critRate: Int?
    
    /// The likelyhood this attack will cause an ailment
    open var ailmentChance: Int?
    
    /// The likelyhood this attack will cause the target pokemon to flinch
    open var flinchChance: Int?
    
    /// The likelyhood this attack will cause a stat change in the target pokemon
    open var statChance: Int?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Move Stat Change
open class PKMMoveStatChange: Codable {
    
    /// The amount of change
    open var change: Int?
    
    /// The stat being affected
    open var stat: PKMNamedAPIResource<PKMStat>?
}


/// Past Move Stat Values
open class PKMPastMoveStatValues: Codable, SelfDecodable {
    
    /// The percent value of how likely this move is to be successful
    open var accuracy: Int?
    
    /// The percent value of how likely it is this moves effect will take effect
    open var effectChance: Int?
    
    /// The base power of this move with a value of 0 if it does not have a base power
    open var power: Int?
    
    /// Power points. The number of times this move can be used
    open var pp: Int?
    
    /// The effect of this move listed in different languages
    open var effectEntries: [PKMVerboseEffect]?
    
    /// The elemental type of this move
    open var type: PKMNamedAPIResource<PKMType>?
    
    /// The version group in which these move stat values were in effect
    open var versionGroup: PKMNamedAPIResource<PKMVersion>?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Move Ailments

/// Move Ailments are status conditions caused by moves used during battle. See Bulbapedia for greater detail.
open class PKMMoveAilment: Codable {
    
    /// The identifier for this move ailment resource
    open var id: Int?
    
    /// The name for this move ailment resource
    open var name: String?
    
    /// A list of moves that cause this ailment
    open var moves: [PKMNamedAPIResource<PKMMove>]?
    
    /// The name of this move ailment listed in different languages
    open var names: [PKMName]?
}



// MARK: - Move Battle Styles

/// Styles of moves when used in the Battle Palace. See Bulbapedia for greater detail.
open class PKMMoveBattleStyle: Codable {
    
    /// The identifier for this move battle style resource
    open var id: Int?
    
    /// The name for this move battle style resource
    open var name: String?
    
    /// The name of this move battle style listed in different languages
    open var names: [PKMName]?
}



// MARK - Move Categories

/// Very general categories that loosely group move effects.
open class PKMMoveCategory: Codable {
    
    /// The identifier for this move category resource
    open var id: Int?
    
    /// The name for this move category resource
    open var name: String?
    
    /// A list of moves that fall into this category
    open var moves: [PKMNamedAPIResource<PKMMove>]?
    
    /// The description of this move ailment listed in different languages
    open var descriptions: [PKMDescription]?
}



// MARK: - Move Damage Classes

/// Damage classes moves can have, e.g. physical, special, or non-damaging.
open class PKMMoveDamageClass: Codable {
    
    /// The identifier for this move damage class resource
    open var id: Int?
    
    /// The name for this move damage class resource
    open var name: String?
    
    /// The description of this move damage class listed in different languages
    open var descriptions: [PKMDescription]?
    
    /// A list of moves that fall into this damage class
    open var moves: [PKMNamedAPIResource<PKMMove>]?
    
    /// The name of this move damage class listed in different languages
    open var names: [PKMName]?
}



// MARK: - Move Learn Methods

/// Methods by which Pokémon can learn moves.
open class PKMMoveLearnMethod: Codable, SelfDecodable {
    
    /// The identifier for this move learn method resource
    open var id: Int?
    
    /// The name for this move learn method resource
    open var name: String?
    
    /// The description of this move learn method listed in different languages
    open var descriptions: [PKMDescription]?
    
    /// The name of this move learn method listed in different languages
    open var names: [PKMName]?
    
    /// A list of version groups where moves can be learned through this method
    open var versionGroups: [PKMNamedAPIResource<PKMVersionGroup>]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Move Targets

/// Targets moves can be directed at during battle. Targets can be Pokémon, environments or even other moves.
open class PKMMoveTarget: Codable {
    
    /// The identifier for this move target resource
    open var id: Int?
    
    /// The name for this move target resource
    open var name: String?
    
    /// The description of this move target listed in different languages
    open var descriptions: [PKMDescription]?
    
    /// A list of moves that that are directed at this target
    open var moves: [PKMNamedAPIResource<PKMMove>]?
    
    /// The name of this move target listed in different languages
    open var names: [PKMName]?
}



// MARK: - Web Services

open class MoveService {
    /**
     Fetch Moves list
     */
    public static func fetchMoveList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMMove {
        let urlStr = baseURL + "/move"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Move Information
     
     - parameter moveId: Move ID
     */
    public static func fetchMove(_ moveId: Int, completion: @escaping (_ result: Result<PKMMove, HTTPError>) -> Void) {
        let urlStr = baseURL + "/move/\(moveId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Move Information
     
     - parameter moveName: Move Name
     */
    public static func fetchMove(_ moveName: String, completion: @escaping (_ result: Result<PKMMove, HTTPError>) -> Void) {
        let urlStr = baseURL + "/move/\(moveName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Moves Ailments list
     */
    public static func fetchMoveAilmentList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMMoveAilment {
        let urlStr = baseURL + "/move-ailment"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Move Ailment Information
     
     - parameter moveAilmentId: Move Ailment ID
     */
    public static func fetchMoveAilment(_ moveAilmentId: Int, completion: @escaping (_ result: Result<PKMMoveAilment, HTTPError>) -> Void) {
        let urlStr = baseURL + "/move-ailment/\(moveAilmentId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Move Ailment Information
     
     - parameter moveAilmentName: Move Ailment Name
     */
    public static func fetchMoveAilment(_ moveAilmentName: String, completion: @escaping (_ result: Result<PKMMoveAilment, HTTPError>) -> Void) {
        let urlStr = baseURL + "/move-ailment/\(moveAilmentName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Moves Battle Styles list
     */
    public static func fetchMoveBattleStyleList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMMoveBattleStyle {
        let urlStr = baseURL + "/move-battle-style"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Move Battle Style Information
     
     - parameter moveBattleStyleId: Move Battle Style ID
     */
    public static func fetchMoveBattleStyle(_ moveBattleStyleId: Int, completion: @escaping (_ result: Result<PKMMoveBattleStyle, HTTPError>) -> Void) {
        let urlStr = baseURL + "/move-battle-style/\(moveBattleStyleId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Move Battle Style Information
     
     - parameter moveBattleStyleName: Move Battle Style Name
     */
    public static func fetchMoveBattleStyle(_ moveBattleStyleName: String, completion: @escaping (_ result: Result<PKMMoveBattleStyle, HTTPError>) -> Void) {
        let urlStr = baseURL + "/move-battle-style/\(moveBattleStyleName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Moves Categories list
     */
    public static func fetchMoveCategoryList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMMoveCategory {
        let urlStr = baseURL + "/move-category"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Move Category Information
     
     - parameter moveCategoryId: Move Category ID
     */
    public static func fetchMoveCategory(_ moveCategoryId: Int, completion: @escaping (_ result: Result<PKMMoveCategory, HTTPError>) -> Void) {
        let urlStr = baseURL + "/move-category/\(moveCategoryId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Move Category Information
     
     - parameter moveCategoryName: Move Category Name
     */
    public static func fetchMoveCategory(_ moveCategoryName: String, completion: @escaping (_ result: Result<PKMMoveCategory, HTTPError>) -> Void) {
        let urlStr = baseURL + "/move-category/\(moveCategoryName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Moves Damage Classes list
     */
    public static func fetchMoveDamageClassList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMMoveDamageClass {
        let urlStr = baseURL + "/move-damage-class"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Move Damage Class Information
     
     - parameter moveDamageClassId: Move Damage Class ID
     */
    public static func fetchMoveDamageClass(_ moveDamageClassId: Int, completion: @escaping (_ result: Result<PKMMoveDamageClass, HTTPError>) -> Void) {
        let urlStr = baseURL + "/move-damage-class/\(moveDamageClassId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Move Damage Class Information
     
     - parameter moveDamageClassName: Move Damage Class Name
     */
    public static func fetchMoveDamageClass(_ moveDamageClassName: String, completion: @escaping (_ result: Result<PKMMoveDamageClass, HTTPError>) -> Void) {
        let urlStr = baseURL + "/move-damage-class/\(moveDamageClassName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Moves Learn Methods list
     */
    public static func fetchMoveLearnMethodList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMMoveLearnMethod {
        let urlStr = baseURL + "/move-learn-method"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Move Learn Method Information
     
     - parameter moveLearnMethodId: Move Learn Method ID
     */
    public static func fetchMoveLearnMethod(_ moveLearnMethodId: Int, completion: @escaping (_ result: Result<PKMMoveLearnMethod, HTTPError>) -> Void) {
        let urlStr = baseURL + "/move-learn-method/\(moveLearnMethodId)"
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Move Learn Method Information
     
     - parameter moveLearnMethodName: Move Learn Method Name
     */
    public static func fetchMoveLearnMethod(_ moveLearnMethodName: String, completion: @escaping (_ result: Result<PKMMoveLearnMethod, HTTPError>) -> Void) {
        let urlStr = baseURL + "/move-learn-method/\(moveLearnMethodName)"
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Moves Targets list
     */
    public static func fetchMoveTargetList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMMoveTarget {
        let urlStr = baseURL + "/move-target"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Move Target Information
     
     - parameter moveTargetId: Move Target ID
     */
    public static func fetchMoveTarget(_ moveTargetId: Int, completion: @escaping (_ result: Result<PKMMoveTarget, HTTPError>) -> Void) {
        let urlStr = baseURL + "/move-target/\(moveTargetId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Move Target Information
     
     - parameter moveTargetName: Move Target Name
     */
    public static func fetchMoveTarget(_ moveTargetName: String, completion: @escaping (_ result: Result<PKMMoveTarget, HTTPError>) -> Void) {
        let urlStr = baseURL + "/move-target/\(moveTargetName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
}
