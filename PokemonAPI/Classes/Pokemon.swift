//
//  Pokemon.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/27/18.
//

import Foundation


// MARK: - Abilities

/// Abilities provide passive effects for Pokémon in battle or in the overworld. Pokémon have mutiple possible abilities but can have only one ability at a time. Check out Bulbapedia for greater detail.
public struct PKMAbility: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this ability resource
    public let id: Int?
    
    /// The name for this ability resource
    public let name: String?
    
    /// Whether or not this ability originated in the main series of the video games
    public let isMainSeries: Bool?
    
    /// The generation this ability originated in
    public let generation: PKMAPIResource<PKMGeneration>?
    
    /// The name of this ability listed in different languages
    public let names: [PKMName]?
    
    /// The effect of this ability listed in different languages
    public let effectEntries: [PKMVerboseEffect]?
    
    /// The list of previous effects this ability has had across version groups
    public let effectChanges: [PKMAbilityEffectChange]?
    
    /// The flavor text of this ability listed in different languages
    public let flavorTextEntries: [PKMAbilityFlavorText]?
    
    /// A list of Pokémon that could potentially have this ability
    public let pokemon: [PKMAbilityPokemon]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Ability Effect Change
public struct PKMAbilityEffectChange: Codable, SelfDecodable, Sendable {
    
    /// The previous effect of this ability listed in different languages
    public let effectEntries: [PKMEffect]?
    
    /// The version group in which the previous effect of this ability originated
    public let versionGroup: PKMAPIResource<PKMVersion>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Ability Flavor Text
public struct PKMAbilityFlavorText: Codable, SelfDecodable, Sendable {
    
    /// The localized name for an API resource in a specific language
    public let flavorText: String?
    
    /// The language this name is in
    public let language: PKMAPIResource<PKMLanguage>?
    
    /// The language this name is in
    public let versionGroup: PKMAPIResource<PKMVersionGroup>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Ability Pokemon
public struct PKMAbilityPokemon: Codable, SelfDecodable, Sendable {
    
    /// Whether or not this a hidden ability for the referenced Pokémon
    public let isHidden: Bool?
    
    /// Pokémon have 3 ability 'slots' which hold references to possible abilities they could have. This is the slot of this ability for the referenced pokemon.
    public let slot: Int?
    
    /// The Pokémon this ability could belong to
    public let pokemon: PKMAPIResource<PKMPokemon>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Characteristics

/// Characteristics indicate which stat contains a Pokémon's highest IV. A Pokémon's Characteristic is determined by the remainder of its highest IV divided by 5 (gene_modulo). Check out Bulbapedia for greater detail.
public struct PKMCharacteristic: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this characteristic resource
    public let id: Int?
    
    /// The remainder of the highest stat/IV divided by 5
    public let geneModulo: Int?
    
    /// The possible values of the highest stat that would result in a Pokémon recieving this characteristic when divided by 5
    public let possibleValues: [Int]?
    
    /// The stat which results in this characteristic.
    public let highestStat: PKMAPIResource<PKMStat>?
    
    /// The descriptions of this characteristic listed in different languages
    public let descriptions: [PKMDescription]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Egg Groups

/// Egg Groups are categories which determine which Pokémon are able to interbreed. Pokémon may belong to either one or two Egg Groups. Check out Bulbapedia for greater detail.
public struct PKMEggGroup: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this egg group resource
    public let id: Int?
    
    /// The name for this egg group resource
    public let name: String?
    
    /// The name of this egg group listed in different languages
    public let names: [PKMName]?
    
    /// A list of all Pokémon species that are members of this egg group
    public let pokemonSpecies: [PKMAPIResource<PKMPokemonSpecies>]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Genders

/// Genders were introduced in Generation II for the purposes of breeding Pokémon but can also result in visual differences or even different evolutionary lines. Check out Bulbapedia for greater detail.
public struct PKMGender: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this gender resource
    public let id: Int?
    
    /// The name for this gender resource
    public let name: String?
    
    /// A list of Pokémon species that can be this gender and how likely it is that they will be
    public let pokemonSpeciesDetails: [PKMPokemonSpeciesGender]?
    
    /// A list of Pokémon species that required this gender in order for a Pokémon to evolve into them
    public let requiredForEvolution: [PKMAPIResource<PKMPokemonSpecies>]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Species Gender
public struct PKMPokemonSpeciesGender: Codable, SelfDecodable, Sendable {
    
    /// The chance of this Pokémon being female, in eighths; or -1 for genderless
    public let rate: Int?
    
    /// A Pokémon species that can be the referenced gender
    public let pokemonSpecies: PKMAPIResource<PKMPokemonSpecies>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Growth Rates

/// Growth rates are the speed with which Pokémon gain levels through experience. Check out Bulbapedia ( http://bulbapedia.bulbagarden.net/wiki/Experience ) for greater detail.
public struct PKMGrowthRate: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this gender resource
    public let id: Int?
    
    /// The name for this gender resource
    public let name: String?
    
    /// The formula used to calculate the rate at which the Pokémon species gains level
    public let formula: String?
    
    /// The descriptions of this characteristic listed in different languages
    public let descriptions: [PKMDescription]?
    
    /// A list of levels and the amount of experienced needed to atain them based on this growth rate
    public let levels: [PKMGrowthRateExperienceLevel]?
    
    /// A list of Pokémon species that gain levels at this growth rate
    public let pokemonSpecies: [PKMAPIResource<PKMPokemonSpecies>]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Growth Rate Experience Level
public struct PKMGrowthRateExperienceLevel: Codable, Sendable {
    
    /// The level gained
    public let level: Int?
    
    /// The amount of experience required to reach the referenced level
    public let experience: Int?
}



// MARK: - Natures

/// Natures influence how a Pokémon's stats grow. See Bulbapedia ( http://bulbapedia.bulbagarden.net/wiki/Nature ) for greater detail.
public struct PKMNature: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this nature resource
    public let id: Int?
    
    /// The name for this nature resource
    public let name: String?
    
    /// The stat decreased by 10% in Pokémon with this nature
    public let decreasedStat: PKMAPIResource<PKMStat>?
    
    /// The stat increased by 10% in Pokémon with this nature
    public let increasedStat: PKMAPIResource<PKMStat>?
    
    /// The flavor hated by Pokémon with this nature
    public let hatesFlavor: PKMAPIResource<PKMBerryFlavor>?
    
    /// he flavor liked by Pokémon with this nature
    public let likesFlavor: PKMAPIResource<PKMBerryFlavor>?
    
    /// A list of Pokéathlon stats this nature effects and how much it effects them
    public let pokeathlonStatChanges: [PKMNatureStatChange]?
    
    /// A list of battle styles and how likely a Pokémon with this nature is to use them in the Battle Palace or Battle Tent.
    public let moveBattleStylePreferences: [PKMMoveBattleStylePreference]?
    
    /// The name of this nature listed in different languages
    public let names: [PKMName]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Nature Stat Change
public struct PKMNatureStatChange: Codable, SelfDecodable, Sendable {
    
    /// The amount of change
    public let maxChange: Int?
    
    /// The stat being affected
    public let pokeathlonStat: PKMAPIResource<PKMPokeathlonStat>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Move Battle Style Preference
public struct PKMMoveBattleStylePreference: Codable, SelfDecodable, Sendable {
    
    /// Chance of using the move, in percent, if HP is under one half
    public let lowHpPreference: Int?
    
    /// Chance of using the move, in percent, if HP is over one half
    public let highHpPreference: Int?
    
    /// The move battle style
    public let moveBattleStyle: PKMAPIResource<PKMMoveBattleStyle>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Pokeathlon Stats

/// Pokeathlon Stats are different attributes of a Pokémon's performance in Pokéathlons. In Pokéathlons, competitions happen on different courses; one for each of the different Pokéathlon stats. See Bulbapedia for greater detail.
public struct PKMPokeathlonStat: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this Pokéathlon stat resource
    public let id: Int?
    
    /// The name for this Pokéathlon stat resource
    public let name: String?
    
    /// The name of this Pokéathlon stat listed in different languages
    public let names: [PKMName]?
    
    /// A detail of natures which affect this Pokéathlon stat positively or negatively
    public let affectingNatures: PKMNaturePokeathlonStatAffectSets?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Nature Pokeathlon Stat Affect Sets
public struct PKMNaturePokeathlonStatAffectSets: Codable, Sendable {
    
    /// A list of natures and how they change the referenced Pokéathlon stat
    public let increase: [PKMNaturePokeathlonStatAffect]?
    
    /// A list of natures and how they change the referenced Pokéathlon stat
    public let decrease: [PKMNaturePokeathlonStatAffect]?
}


/// Nature Pokeathlon Stat Affect
public struct PKMNaturePokeathlonStatAffect: Codable, SelfDecodable, Sendable {
    
    /// The maximum amount of change to the referenced Pokéathlon stat
    public let maxChange: Int?
    
    /// The nature causing the change
    public let nature: PKMAPIResource<PKMNature>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Pokemon

/// Pokémon are the creatures that inhabit the world of the Pokémon games. They can be caught using Pokéballs and trained by battling with other Pokémon. See Bulbapedia for greater detail.
public struct PKMPokemon: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this Pokémon resource
    public let id: Int?
    
    /// The name for this Pokémon resource
    public let name: String?
    
    /// The base experience gained for defeating this Pokémon
    public let baseExperience: Int?
    
    /// The height of this Pokémon
    public let height: Int?
    
    /// Set for exactly one Pokémon used as the default for each species
    public let isDefault: Bool?
    
    /// Order for sorting. Almost national order, except families are grouped together.
    public let order: Int?
    
    /// The weight of this Pokémon
    public let weight: Int?
    
    /// A list of abilities this Pokémon could potentially have
    public let abilities: [PKMPokemonAbility]?
    
    /// A list of forms this Pokémon can take on
    public let forms: [PKMAPIResource<PKMPokemonForm>]?
    
    /// A list of game indices relevent to Pokémon item by generation
    public let gameIndices: [PKMVersionGameIndex]?
    
    /// A list of items this Pokémon may be holding when encountered
    public let heldItems: [PKMPokemonHeldItem]?
    
    /// A list of location areas as well as encounter details pertaining to specific versions
    public let locationAreaEncounters: String?
    
    /// A list of moves along with learn methods and level details pertaining to specific version groups
    public let moves: [PKMPokemonMove]?
    
    /// A list of details showing types this pokémon had in previous generations
    public let pastTypes: [PKMPokemonTypePast]
    
    /// A list of details showing abilities this pokémon had in previous generations
    public let pastAbilities: [PKMPokemonAbilityPast]
    
    /// A set of sprites used to depict this Pokémon in the game
    public let sprites: PKMPokemonSprites?
    
    /// The species this Pokémon belongs to
    public let species: PKMAPIResource<PKMPokemonSpecies>?
    
    /// A set of cries used to depict this Pokémon in the game.
    public let cries: PKMPokemonCries?
    
    /// A list of base stat values for this Pokémon
    public let stats: [PKMPokemonStat]?
    
    /// A list of details showing types this Pokémon has
    public let types: [PKMPokemonType]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Ability
public struct PKMPokemonAbility: Codable, SelfDecodable, Sendable {
    
    /// Whether or not this is a hidden ability
    public let isHidden: Bool?
    
    /// The slot this ability occupies in this Pokémon species
    public let slot: Int?
    
    /// The ability the Pokémon may have
    public let ability: PKMAPIResource<PKMAbility>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Type
public struct PKMPokemonType: Codable, Sendable {
    
    /// The order the Pokémon's types are listed in
    public let slot: Int?
    
    /// The type the referenced Pokémon has
    public let type: PKMAPIResource<PKMType>?
}


/// Pokemon Form Type
public struct PKMPokemonFormType: Codable, Sendable {
    
    /// The order the Pokémon's types are listed in
    public let slot: Int?
    
    /// The type the referenced Form has.
    public let type: PKMAPIResource<PKMType>?
}


/// Pokemon Type Past
public struct PKMPokemonTypePast: Codable, Sendable {
    
    /// The item the referenced Pokémon holds.
    public let item: PKMAPIResource<PKMItem>?
    
    /// The details of the different versions in which the item is held.
    public let versionDetails: [PKMPokemonHeldItemVersion]?
}


/// Pokemon Ability Past
public struct PKMPokemonAbilityPast: Codable, Sendable {
    
    /// The last generation in which the referenced pokémon had the listed abilities.
    public let generation: PKMAPIResource<PKMGeneration>?
    
    /// The abilities the referenced pokémon had up to and including the listed generation. If null, the slot was previously empty.
    public let ability: [PKMAbility]?
}


/// Pokemon Held Item
public struct PKMPokemonHeldItem: Codable, SelfDecodable, Sendable {
    
    /// The item the referenced Pokémon holds
    public let item: PKMAPIResource<PKMItem>?
    
    /// The details of the different versions in which the item is held
    public let versionDetails: [PKMPokemonHeldItemVersion]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Held Item Version
public struct PKMPokemonHeldItemVersion: Codable, Sendable {
    
    /// The version in which the item is held
    public let version: PKMAPIResource<PKMVersion>?
    
    /// How often the item is held
    public let rarity: Int?
}


/// Pokemon Move
public struct PKMPokemonMove: Codable, SelfDecodable, Sendable {
    
    /// The move the Pokémon can learn
    public let move: PKMAPIResource<PKMMove>?
    
    /// The details of the version in which the Pokémon can learn the move
    public let versionGroupDetails: [PKMPokemonMoveVersion]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Move Version
public struct PKMPokemonMoveVersion: Codable, SelfDecodable, Sendable {
    
    /// The method by which the move is learned
    public let moveLearnMethod: PKMAPIResource<PKMMoveLearnMethod>?
    
    /// The version group in which the move is learned
    public let versionGroup: PKMAPIResource<PKMVersionGroup>?
    
    /// The minimum level to learn the move.
    public let levelLearnedAt: Int?
    
    /// Order by which the pokemon will learn the move. A newly learnt move will replace the move with lowest order.
    public let order: Int?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Stat
public struct PKMPokemonStat: Codable, SelfDecodable, Sendable {
    
    /// The stat the Pokémon has
    public let stat: PKMAPIResource<PKMStat>?
    
    /// The effort points (EV) the Pokémon has in the stat
    public let effort: Int?
    
    /// The base value of the stat
    public let baseStat: Int?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Cries
public struct PKMPokemonCries: Codable, Sendable {
    
    /// The latest depiction of this Pokémon's cry.
    public let latest: String?
    
    /// The legacy depiction of this Pokémon's cry.
    public let legacy: String?
}



// MARK: - Pokemon Sprites

/// Pokemon Sprites
public struct PKMPokemonSprites: Codable, SelfDecodable, Sendable {
    
    /// The default depiction of this Pokémon from the front in battle
    public let frontDefault: String?
    
    /// The shiny depiction of this Pokémon from the front in battle
    public let frontShiny: String?
    
    /// The female depiction of this Pokémon from the front in battle
    public let frontFemale: String?
    
    /// The shiny female depiction of this Pokémon from the front
    public let frontShinyFemale: String?
    
    /// The default depiction of this Pokémon from the back in battle
    public let backDefault: String?
    
    /// The shiny depiction of this Pokémon from the back in battle
    public let backShiny: String?
    
    /// The female depiction of this Pokémon from the back in battle
    public let backFemale: String?
    
    /// The shiny female depiction of this Pokémon from the back in battle
    public let backShinyFemale: String?
    
    public let other: PKMPokemonSpritesOther?
    
    public let versions: PKMPokemonSpritesVersions?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Sprites
public struct PKMPokemonSpritesBase: Codable, SelfDecodable, Sendable {
    
    /// The default depiction of this Pokémon from the front in battle
    public let frontDefault: String?
    
    /// The shiny depiction of this Pokémon from the front in battle
    public let frontShiny: String?
    
    /// The female depiction of this Pokémon from the front in battle
    public let frontFemale: String?
    
    /// The shiny female depiction of this Pokémon from the front
    public let frontShinyFemale: String?
    
    /// The default depiction of this Pokémon from the back in battle
    public let backDefault: String?
    
    /// The shiny depiction of this Pokémon from the back in battle
    public let backShiny: String?
    
    /// The female depiction of this Pokémon from the back in battle
    public let backFemale: String?
    
    /// The shiny female depiction of this Pokémon from the back in battle
    public let backShinyFemale: String?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Sprites from other sources
public struct PKMPokemonSpritesOther: Codable, Sendable {
    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case home
        case officialArtwork = "official-artwork"
        case showdown
    }
    
    public let dreamWorld: PKMPokemonSpritesBase?
    public let home: PKMPokemonSpritesBase?
    public let officialArtwork: PKMPokemonSpritesBase?
    public let showdown: PKMPokemonSpritesBase?
}


/// Pokemon Sprites from other versions
public struct PKMPokemonSpritesVersions: Codable, Sendable {
    enum CodingKeys: String, CodingKey {
        case generation1 = "generation-i"
        case generation2 = "generation-ii"
        case generation3 = "generation-iii"
        case generation4 = "generation-iv"
        case generation5 = "generation-v"
        case generation6 = "generation-vi"
        case generation7 = "generation-vii"
        case generation8 = "generation-viii"
        case generation9 = "generation-ix"
    }
    
    public let generation1: PKMPokemonSpritesVersionsGeneration1?
    public let generation2: PKMPokemonSpritesVersionsGeneration2?
    public let generation3: PKMPokemonSpritesVersionsGeneration3?
    public let generation4: PKMPokemonSpritesVersionsGeneration4?
    public let generation5: PKMPokemonSpritesVersionsGeneration5?
    public let generation6: PKMPokemonSpritesVersionsGeneration6?
    public let generation7: PKMPokemonSpritesVersionsGeneration7?
    public let generation8: PKMPokemonSpritesVersionsGeneration8?
    public let generation9: PKMPokemonSpritesVersionsGeneration9?
}


public struct PKMPokemonSpritesVersionsGeneration1: Codable, Sendable {
    enum CodingKeys: String, CodingKey {
        case redBlue = "red-blue"
        case yellow
    }
    
    public let redBlue: PKMPokemonSpritesBase?
    public let yellow: PKMPokemonSpritesBase?
}

public struct PKMPokemonSpritesVersionsGeneration2: Codable, Sendable {
    public let crystal: PKMPokemonSpritesBase?
    public let gold: PKMPokemonSpritesBase?
    public let silver: PKMPokemonSpritesBase?
}

public struct PKMPokemonSpritesVersionsGeneration3: Codable, Sendable {
    enum CodingKeys: String, CodingKey {
        case emerald
        case fireRedLeafGreen = "firered-leafgreen"
        case rubySapphire = "ruby-sapphire"
    }
    
    public let emerald: PKMPokemonSpritesBase?
    public let fireRedLeafGreen: PKMPokemonSpritesBase?
    public let rubySapphire: PKMPokemonSpritesBase?
}

public struct PKMPokemonSpritesVersionsGeneration4: Codable, Sendable {
    enum CodingKeys: String, CodingKey {
        case diamondPearl = "diamond-pearl"
        case heartGoldSoulSilver = "heartgold-soulsilver"
        case platinum
    }
    
    public let diamondPearl: PKMPokemonSpritesBase?
    public let heartGoldSoulSilver: PKMPokemonSpritesBase?
    public let platinum: PKMPokemonSpritesBase?
}

public struct PKMPokemonSpritesVersionsGeneration5: Codable, Sendable {
    enum CodingKeys: String, CodingKey {
        case blackWhite = "black-white"
    }
    
    public let blackWhite: PKMPokemonSpritesBase?
}

public struct PKMPokemonSpritesVersionsGeneration6: Codable, Sendable {
    enum CodingKeys: String, CodingKey {
        case omegaRubyAlphaSapphire = "omegaruby-alphasapphire"
        case xY = "x-y"
    }
    
    public let omegaRubyAlphaSapphire: PKMPokemonSpritesBase?
    public let xY: PKMPokemonSpritesBase?
}

public struct PKMPokemonSpritesVersionsGeneration7: Codable, Sendable {
    enum CodingKeys: String, CodingKey {
        case icons
        case ultraSunUltraMoon = "ultra-sun-ultra-moon"
    }
    
    public let icons: PKMPokemonSpritesBase?
    public let ultraSunUltraMoon: PKMPokemonSpritesBase?
}

public struct PKMPokemonSpritesVersionsGeneration8: Codable, Sendable {
    public let icons: PKMPokemonSpritesBase?
}

public struct PKMPokemonSpritesVersionsGeneration9: Codable, Sendable {
    public let icons: PKMPokemonSpritesBase?
}



// MARK: - Pokemon Location Areas

/// Location Area Encounter
public struct PKMLocationAreaEncounter: Codable, SelfDecodable, Sendable {
    
    /// The location area the referenced Pokémon can be encountered in
    public let locationArea: PKMAPIResource<PKMLocationArea>?
    
    /// A list of versions and encounters with the referenced Pokémon that might happen
    public let versionDetails: [PKMVersionEncounterDetail]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Pokemon Colors

/// Colors used for sorting Pokémon in a Pokédex. The color listed in the Pokédex is usually the color most apparent or covering each Pokémon's body. No orange category exists; Pokémon that are primarily orange are listed as red or brown.
public struct PKMPokemonColor: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this Pokémon color resource
    public let id: Int?
    
    /// The name for this Pokémon color resource
    public let name: String?
    
    /// The name of this Pokémon color listed in different languages
    public let names: [PKMName]?
    
    /// A list of the Pokémon species that have this color
    public let pokemonSpecies: [PKMAPIResource<PKMPokemonSpecies>]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Pokemon Forms

/// Some Pokémon have the ability to take on different forms. At times, these differences are purely cosmetic and have no bearing on the difference in the Pokémon's stats from another; however, several Pokémon differ in stats (other than HP), type, and Ability depending on their form.
public struct PKMPokemonForm: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this Pokémon form resource
    public let id: Int?
    
    /// The name for this Pokémon form resource
    public let name: String?
    
    /// The order in which forms should be sorted within all forms. Multiple forms may have equal order, in which case they should fall back on sorting by name.
    public let order: Int?
    
    /// The order in which forms should be sorted within a species' forms
    public let formOrder: Int?
    
    /// True for exactly one form used as the default for each Pokémon
    public let isDefault: Bool?
    
    /// Whether or not this form can only happen during battle
    public let isBattleOnly: Bool?
    
    /// Whether or not this form requires mega evolution
    public let isMega: Bool?
    
    /// The name of this form
    public let formName: String?
    
    /// The Pokémon that can take on this form
    public let pokemon: PKMAPIResource<PKMPokemon>?
    
    /// A list of details showing types this  Pokémon form has.
    public let types: [PKMPokemonFormType]?
    
    /// A set of sprites used to depict this Pokémon form in the game
    public let sprites: PKMPokemonFormSprites?
    
    /// The version group this Pokémon form was introduced in
    public let versionGroup: PKMAPIResource<PKMVersionGroup>?
    
    /// The form specific full name of this Pokémon form, or empty if the form does not have a specific name
    public let names: [PKMName]?
    
    /// The form specific form name of this Pokémon form, or empty if the form does not have a specific name
    public let formNames: [PKMName]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Form Sprites
public struct PKMPokemonFormSprites: Codable, SelfDecodable, Sendable {
    
    /// The default depiction of this Pokémon form from the front in battle
    public let frontDefault: String?
    
    /// The shiny depiction of this Pokémon form from the front in battle
    public let frontShiny: String?
    
    /// The default depiction of this Pokémon form from the back in battle
    public let backDefault: String?
    
    /// The shiny depiction of this Pokémon form from the back in battle
    public let backShiny: String?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Pokemon Habitats

/// Habitats are generally different terrain Pokémon can be found in but can also be areas designated for rare or legendary Pokémon.
public struct PKMPokemonHabitat: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this Pokémon habitat resource
    public let id: Int?
    
    /// The name for this Pokémon habitat resource
    public let name: String?
    
    /// The name of this Pokémon habitat listed in different languages
    public let names: [PKMName]?
    
    /// A list of the Pokémon species that can be found in this habitat
    public let pokemonSpecies: [PKMAPIResource<PKMPokemonSpecies>]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Pokemon Shapes

/// Shapes used for sorting Pokémon in a Pokédex.
public struct PKMPokemonShape: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this Pokémon shape
    public let id: Int?
    
    /// The name for this Pokémon shape resource
    public let name: String?
    
    /// The "scientific" name of this Pokémon shape listed in different languages
    public let awesomeNames: [PKMAwesomeName]?
    
    /// The name of this Pokémon shape listed in different languages
    public let names: [PKMName]?
    
    /// A list of the Pokémon species that have this shape
    public let pokemonSpecies: [PKMAPIResource<PKMPokemonSpecies>]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// An Awesome Name
public struct PKMAwesomeName: Codable, SelfDecodable, Sendable {
    
    /// The localized "scientific" name for an API resource in a specific language
    public let awesomeName: String?
    
    /// The language this "scientific" name is in
    public let language: PKMAPIResource<PKMLanguage>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Pokemon Species

/// A Pokémon Species forms the basis for at least one Pokémon. Attributes of a Pokémon species are shared across all varieties of Pokémon within the species. A good example is Wormadam; Wormadam is the species which can be found in three different varieties, Wormadam-Trash, Wormadam-Sandy and Wormadam-Plant.
public struct PKMPokemonSpecies: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this Pokémon species resource
    public let id: Int?
    
    /// The name for this Pokémon species resource
    public let name: String?
    
    /// The order in which species should be sorted. Based on National Dex order, except families are grouped together and sorted by stage.
    public let order: Int?
    
    /// The chance of this Pokémon being female, in eighths; or -1 for genderless
    public let genderRate: Int?
    
    /// The base capture rate; up to 255. The higher the number, the easier the catch.
    public let captureRate: Int?
    
    /// The happiness when caught by a normal Pokéball; up to 255. The higher the number, the happier the Pokémon.
    public let baseHappiness: Int?
    
    /// Whether or not this is a baby Pokémon
    public let isBaby: Bool?
    
    /// Whether or not this is a legendary Pokémon.
    public let isLegendary: Bool?
    
    /// Whether or not this is a mythical Pokémon.
    public let isMythical: Bool?
    
    /// Initial hatch counter: one must walk 255 × (hatch_counter + 1) steps before this Pokémon's egg hatches, unless utilizing bonuses like Flame Body's
    public let hatchCounter: Int?
    
    /// Whether or not this Pokémon can have different genders
    public let hasGenderDifferences: Bool?
    
    /// Whether or not this Pokémon has multiple forms and can switch between them
    public let formsSwitchable: Bool?
    
    /// The rate at which this Pokémon species gains levels
    public let growthRate: PKMAPIResource<PKMGrowthRate>?
    
    /// A list of pokedexes and the indexes reserved within them for this Pokémon species
    public let pokedexNumbers: [PKMPokemonSpeciesDexEntry]?
    
    /// A list of egg groups this Pokémon species is a member of
    public let eggGroups: [PKMAPIResource<PKMEggGroup>]?
    
    /// The color of this Pokémon for gimmicky Pokédex search
    public let color: PKMAPIResource<PKMPokemonColor>?
    
    /// The shape of this Pokémon for gimmicky Pokédex search
    public let shape: PKMAPIResource<PKMPokemonShape>?
    
    /// The Pokémon species that evolves into this pokemon_species
    public let evolvesFromSpecies: PKMAPIResource<PKMPokemonSpecies>?
    
    /// The evolution chain this Pokémon species is a member of
    public let evolutionChain: PKMAPIResource<PKMEvolutionChain>?
    
    /// The habitat this Pokémon species can be encountered in
    public let habitat: PKMAPIResource<PKMPokemonHabitat>?
    
    /// The generation this Pokémon species was introduced in
    public let generation: PKMAPIResource<PKMGeneration>?
    
    /// The name of this Pokémon species listed in different languages
    public let names: [PKMName]?
    
    /// A list of encounters that can be had with this Pokémon species in pal park
    public let palParkEncounters: [PKMPalParkEncounterArea]?
    
    /// The flavor text of this flavor text listed in different languages
    public let flavorTextEntries: [PKMFlavorText]?
    
    /// Descriptions of different forms Pokémon take on within the Pokémon species
    public let formDescriptions: [PKMDescription]?
    
    /// The genus of this Pokémon species listed in multiple languages
    public let genera: [PKMGenus]?
    
    /// A list of the Pokémon that exist within this Pokémon species
    public let varieties: [PKMPokemonSpeciesVariety]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Genus
public struct PKMGenus: Codable, Sendable {
    
    /// The localized genus for the referenced pokemon species
    public let genus: String?
    
    /// The language this genus is in
    public let language: PKMAPIResource<PKMLanguage>?
}


/// Pokemon Species Dex Entry
public struct PKMPokemonSpeciesDexEntry: Codable, SelfDecodable, Sendable {
    
    /// The index number within the Pokédex
    public let entryNumber: Int?
    
    /// The Pokédex the referenced Pokémon species can be found in
    public let pokedex: PKMAPIResource<PKMPokedex>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// PalPark Encounter Area
public struct PKMPalParkEncounterArea: Codable, SelfDecodable, Sendable {
    
    /// The base score given to the player when the referenced Pokémon is caught during a pal park run
    public let baseScore: Int?
    
    /// The base rate for encountering the referenced Pokémon in this pal park area
    public let rate: Int?
    
    /// The pal park area where this encounter happens
    public let area: PKMAPIResource<PKMPalParkArea>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Species Variety
public struct PKMPokemonSpeciesVariety: Codable, SelfDecodable, Sendable {
    
    // Whether this variety is the default variety
    public let isDefault: Bool?
    
    // The Pokémon variety
    public let pokemon: PKMAPIResource<PKMPokemon>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Stats

/// Stats determine certain aspects of battles. Each Pokémon has a value for each stat which grows as they gain levels and can be altered momentarily by effects in battles.
public struct PKMStat: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this stat resource
    public let id: Int?
    
    /// The name for this stat resource
    public let name: String?
    
    /// ID the games use for this stat
    public let gameIndex: Int?
    
    /// Whether this stat only exists within a battle
    public let isBattleOnly: Bool?
    
    /// A detail of moves which affect this stat positively or negatively
    public let affectingMoves: PKMMoveStatAffectSets?
    
    //// A detail of natures which affect this stat positively or negatively
    public let affectingNatures: PKMNatureStatAffectSets?
    
    /// A list of characteristics that are set on a Pokémon when its highest base stat is this stat
    public let characteristics: [PKMAPIResource<PKMCharacteristic>]?
    
    /// The class of damage this stat is directly related to
    public let moveDamageClass: PKMAPIResource<PKMMoveDamageClass>?
    
    /// The name of this region listed in different languages
    public let names: [PKMName]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Move Stat Affect Sets
public struct PKMMoveStatAffectSets: Codable, Sendable {
    
    /// A list of natures and how they change the referenced stat
    public let increase: [PKMMoveStatAffect]?
    
    /// A list of nature sand how they change the referenced stat
    public let decrease: [PKMMoveStatAffect]?
}


/// Move Stat Affect
public struct PKMMoveStatAffect: Codable, SelfDecodable, Sendable {
    
    /// The maximum amount of change to the referenced stat
    public let change: Int?
    
    /// The move causing the change
    public let move: PKMAPIResource<PKMMove>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Nature Affect Set
public struct PKMNatureStatAffectSets: Codable, Sendable {
    
    /// A list of natures and how they change the referenced stat
    public let increase: [PKMAPIResource<PKMNature>]?
    
    /// A list of nature sand how they change the referenced stat
    public let decrease: [PKMAPIResource<PKMNature>]?
}



// MARK: - Types

/// Types are properties for Pokémon and their moves. Each type has three properties: which types of Pokémon it is super effective against, which types of Pokémon it is not very effective against, and which types of Pokémon it is completely ineffective against.
public struct PKMType: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this type resource
    public let id: Int?
    
    /// The name for this type resource
    public let name: String?
    
    /// A detail of how effective this type is toward others and vice versa
    public let damageRelations: PKMTypeRelations?
    
    /// A list of details of how effective this type was toward others and vice versa in previous generations
    public let pastDamageRelations: [PKMTypeRelationsPast]?
    
    /// A list of game indices relevent to this item by generation
    public let gameIndices: [PKMGenerationGameIndex]?
    
    /// The generation this type was introduced in
    public let generation: PKMAPIResource<PKMGeneration>?
    
    /// The class of damage inflicted by this type
    public let moveDamageClass: PKMAPIResource<PKMMoveDamageClass>?
    
    /// The name of this type listed in different languages
    public let names: [PKMName]?
    
    /// A list of details of Pokémon that have this type
    public let pokemon: [PKMTypePokemon]?
    
    /// A list of moves that have this type
    public let moves: [PKMAPIResource<PKMMove>]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Type
public struct PKMTypePokemon: Codable, Sendable {
    
    /// The order the Pokémon's types are listed in
    public let slot: Int?
    
    /// The Pokémon that has the referenced type
    public let pokemon: PKMAPIResource<PKMPokemon>?
}


/// Pokemon Type Relations
public struct PKMTypeRelations: Codable, SelfDecodable, Sendable {
    
    /// A list of types this type has no effect on
    public let noDamageTo: [PKMAPIResource<PKMType>]?
    
    /// A list of types this type is not very effect against
    public let halfDamageTo: [PKMAPIResource<PKMType>]?
    
    /// A list of types this type is very effect against
    public let doubleDamageTo: [PKMAPIResource<PKMType>]?
    
    /// A list of types that have no effect on this type
    public let noDamageFrom: [PKMAPIResource<PKMType>]?
    
    /// A list of types that are not very effective against this type
    public let halfDamageFrom: [PKMAPIResource<PKMType>]?
    
    /// A list of types that are very effective against this type
    public let doubleDamageFrom: [PKMAPIResource<PKMType>]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Type Relations Past
public struct PKMTypeRelationsPast: Codable, SelfDecodable, Sendable {
    
    /// The last generation in which the referenced type had the listed damage relations
    public let generation: PKMAPIResource<PKMGeneration>?
    
    /// The damage relations the referenced type had up to and including the listed generation
    public let damageRelations: PKMTypeRelations?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
