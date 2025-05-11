//
//  Moves.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/27/18.
//

import Foundation


/// Moves are the skills of Pokémon in battle. In battle, a Pokémon uses one move each turn. Some moves (including those learned by Hidden Machine) can be used outside of battle as well, usually for the purpose of removing obstacles or exploring new areas.
public struct PKMMove: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this move resource
    public let id: Int?
    
    /// The name for this move resource
    public let name: String?
    
    /// The percent value of how likely this move is to be successful
    public let accuracy: Int?
    
    /// The percent value of how likely it is this moves effect will happen
    public let effectChance: Int?
    
    /// Power points. The number of times this move can be used
    public let pp: Int?
    
    /// A value between -8 and 8. Sets the order in which moves are executed during battle. See Bulbapedia for greater detail.
    public let priority: Int?
    
    /// The base power of this move with a value of 0 if it does not have a base power
    public let power: Int?
    
    /// A detail of normal and super contest combos that require this move
    public let contestCombos: PKMContestComboSets?
    
    /// The type of appeal this move gives a Pokémon when used in a contest
    public let contestType: PKMAPIResource<PKMContestType>?
    
    /// The effect the move has when used in a contest
    public let contestEffect: PKMAPIResource<PKMContestEffect>?
    
    /// The type of damage the move inflicts on the target, e.g. physical
    public let damageClass: PKMAPIResource<PKMMoveDamageClass>?
    
    /// The effect of this move listed in different languages
    public let effectEntries: [PKMVerboseEffect]?
    
    /// The list of previous effects this move has had across version groups of the games
    public let effectChanges: [PKMAbilityEffectChange]?
    
    /// List of Pokemon that can learn the move
    public let learnedByPokemon: [PKMAPIResource<PKMPokemon>]?
    
    /// The flavor text of this move listed in different languages
    public let flavorTextEntries: [PKMMoveFlavorText]?
    
    /// The generation in which this move was introduced
    public let generation: PKMAPIResource<PKMGeneration>?
    
    /// A list of the machines that teach this move
    public let machines: [PKMMachineVersionDetail]?
    
    /// Metadata about this move
    public let meta: PKMMoveMetaData?
    
    /// The name of this move listed in different languages
    public let names: [PKMName]?
    
    /// A list of move resource value changes across ersion groups of the game
    public let pastValues: [PKMPastMoveStatValues]?
    
    /// A list of stats this moves effects and how much it effects them
    public let statChanges: [PKMMoveStatChange]?
    
    /// The effect the move has when used in a super contest
    public let superContestEffect: PKMAPIResource<PKMSuperContestEffect>?
    
    /// The type of target that will recieve the effects of the attack
    public let target: PKMAPIResource<PKMMoveTarget>?
    
    /// The elemental type of this move    NamedAPIResource
    public let type: PKMAPIResource<PKMType>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Contest Combo Sets
public struct PKMContestComboSets: Codable, Sendable {
    
    /// A detail of moves this move can be used before or after, granting additional appeal points in contests
    public let normal: PKMContestComboDetail?
    
    /// A detail of moves this move can be used before or after, granting additional appeal points in super contests
    public let `super`: PKMContestComboDetail?
}


/// Contest Combo Detail
public struct PKMContestComboDetail: Codable, SelfDecodable, Sendable {
    
    /// A list of moves to use before this move
    public let useBefore: [PKMAPIResource<PKMMove>]?
    
    /// A list of moves to use after this move
    public let useAfter: [PKMAPIResource<PKMMove>]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Move Flavor Text
public struct PKMMoveFlavorText: Codable, SelfDecodable, Sendable {
    
    /// The localized flavor text for an api resource in a specific language
    public let flavorText: String?
    
    /// The language this name is in
    public let language: PKMAPIResource<PKMLanguage>?
    
    /// The version group that uses this flavor text
    public let versionGroup: PKMAPIResource<PKMVersionGroup>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Move Meta Data
public struct PKMMoveMetaData: Codable, SelfDecodable, Sendable {
    
    /// The status ailment this move inflicts on its target
    public let ailment: PKMAPIResource<PKMMoveAilment>?
    
    /// The category of move this move falls under, e.g. damage or ailment
    public let category: PKMAPIResource<PKMMoveCategory>?
    
    /// The minimum number of times this move hits. Null if it always only hits once.
    public let minHits: Int?
    
    /// The maximum number of times this move hits. Null if it always only hits once.
    public let maxHits: Int?
    
    /// The minimum number of turns this move continues to take effect. Null if it always only lasts one turn.
    public let minTurns: Int?
    
    /// The maximum number of turns this move continues to take effect. Null if it always only lasts one turn.
    public let maxTurns: Int?
    
    /// HP drain (if positive) or Recoil damage (if negative), in percent of damage done
    public let drain: Int?
    
    /// The amount of hp gained by the attacking pokemon, in percent of it's maximum HP
    public let healing: Int?
    
    /// Critical hit rate bonus
    public let critRate: Int?
    
    /// The likelyhood this attack will cause an ailment
    public let ailmentChance: Int?
    
    /// The likelyhood this attack will cause the target pokemon to flinch
    public let flinchChance: Int?
    
    /// The likelyhood this attack will cause a stat change in the target pokemon
    public let statChance: Int?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Move Stat Change
public struct PKMMoveStatChange: Codable, Sendable {
    
    /// The amount of change
    public let change: Int?
    
    /// The stat being affected
    public let stat: PKMAPIResource<PKMStat>?
}


/// Past Move Stat Values
public struct PKMPastMoveStatValues: Codable, SelfDecodable, Sendable {
    
    /// The percent value of how likely this move is to be successful
    public let accuracy: Int?
    
    /// The percent value of how likely it is this moves effect will take effect
    public let effectChance: Int?
    
    /// The base power of this move with a value of 0 if it does not have a base power
    public let power: Int?
    
    /// Power points. The number of times this move can be used
    public let pp: Int?
    
    /// The effect of this move listed in different languages
    public let effectEntries: [PKMVerboseEffect]?
    
    /// The elemental type of this move
    public let type: PKMAPIResource<PKMType>?
    
    /// The version group in which these move stat values were in effect
    public let versionGroup: PKMAPIResource<PKMVersionGroup>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Move Ailments

/// Move Ailments are status conditions caused by moves used during battle. See Bulbapedia for greater detail.
public struct PKMMoveAilment: Codable, Sendable {
    
    /// The identifier for this move ailment resource
    public let id: Int?
    
    /// The name for this move ailment resource
    public let name: String?
    
    /// A list of moves that cause this ailment
    public let moves: [PKMAPIResource<PKMMove>]?
    
    /// The name of this move ailment listed in different languages
    public let names: [PKMName]?
}



// MARK: - Move Battle Styles

/// Styles of moves when used in the Battle Palace. See Bulbapedia for greater detail.
public struct PKMMoveBattleStyle: Codable, Sendable {
    
    /// The identifier for this move battle style resource
    public let id: Int?
    
    /// The name for this move battle style resource
    public let name: String?
    
    /// The name of this move battle style listed in different languages
    public let names: [PKMName]?
}



// MARK - Move Categories

/// Very general categories that loosely group move effects.
public struct PKMMoveCategory: Codable, Sendable {
    
    /// The identifier for this move category resource
    public let id: Int?
    
    /// The name for this move category resource
    public let name: String?
    
    /// A list of moves that fall into this category
    public let moves: [PKMAPIResource<PKMMove>]?
    
    /// The description of this move ailment listed in different languages
    public let descriptions: [PKMDescription]?
}



// MARK: - Move Damage Classes

/// Damage classes moves can have, e.g. physical, special, or non-damaging.
public struct PKMMoveDamageClass: Codable, Sendable {
    
    /// The identifier for this move damage class resource
    public let id: Int?
    
    /// The name for this move damage class resource
    public let name: String?
    
    /// The description of this move damage class listed in different languages
    public let descriptions: [PKMDescription]?
    
    /// A list of moves that fall into this damage class
    public let moves: [PKMAPIResource<PKMMove>]?
    
    /// The name of this move damage class listed in different languages
    public let names: [PKMName]?
}



// MARK: - Move Learn Methods

/// Methods by which Pokémon can learn moves.
public struct PKMMoveLearnMethod: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this move learn method resource
    public let id: Int?
    
    /// The name for this move learn method resource
    public let name: String?
    
    /// The description of this move learn method listed in different languages
    public let descriptions: [PKMDescription]?
    
    /// The name of this move learn method listed in different languages
    public let names: [PKMName]?
    
    /// A list of version groups where moves can be learned through this method
    public let versionGroups: [PKMAPIResource<PKMVersionGroup>]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Move Targets

/// Targets moves can be directed at during battle. Targets can be Pokémon, environments or even other moves.
public struct PKMMoveTarget: Codable, Sendable {
    
    /// The identifier for this move target resource
    public let id: Int?
    
    /// The name for this move target resource
    public let name: String?
    
    /// The description of this move target listed in different languages
    public let descriptions: [PKMDescription]?
    
    /// A list of moves that that are directed at this target
    public let moves: [PKMAPIResource<PKMMove>]?
    
    /// The name of this move target listed in different languages
    public let names: [PKMName]?
}
