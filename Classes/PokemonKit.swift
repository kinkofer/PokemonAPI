//
//  PokemonKit.swift
//  Pods
//
//  Created by Yeung Yiu Hung on 28/2/2016.
//
//

import Foundation


// MARK: Constant

let baseURL: String = "http://pokeapi.co/api/v2"



// MARK: Classes

/// Languages for translations of API resource information.
open class PKMLanguage: Codable {
    
    /// The identifier for this language resource
    open var id: Int?
    
    /// The name for this language resource
    open var name: String?
    
    /// Whether or not the games are published in this language
    open var official: Bool?
    
    /// The two-letter code of the country where this language is spoken. Note that it is not unique.
    open var iso639: String?
    
    /// The two-letter code of the language. Note that it is not unique.
    open var iso3166: String?
    
    /// The name of this language listed in different languages
    open var names: [PKMName]?
}

/// Pokemon Type
open class PKMTypePokemon: Codable {
    
    /// The order the Pokémon's types are listed in
    open var slot: Int?
    
    /// The Pokémon that has the referenced type
    open var pokemon: PKMNamedAPIResource?
}

/// Pokemon Type Relations
open class PKMTypeRelations: Codable {
    
    /// A list of types this type has no effect on
    open var noDamageTo: [PKMNamedAPIResource]?
    
    /// A list of types this type is not very effect against
    open var halfDamageTo: [PKMNamedAPIResource]?
    
    /// A list of types this type is very effect against
    open var doubleDamageTo: [PKMNamedAPIResource]?
    
    /// A list of types that have no effect on this type
    open var noDamageFrom: [PKMNamedAPIResource]?
    
    /// A list of types that are not very effective against this type
    open var halfDamageFrom: [PKMNamedAPIResource]?
    
    /// A list of types that are very effective against this type
    open var doubleDamageFrom: [PKMNamedAPIResource]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Types are properties for Pokémon and their moves. Each type has three properties: which types of Pokémon it is super effective against, which types of Pokémon it is not very effective against, and which types of Pokémon it is completely ineffective against.
open class PKMType: Codable {
    
    /// The identifier for this type resource
    open var id: Int?
    
    /// The name for this type resource
    open var name: String?
    
    /// A detail of how effective this type is toward others and vice versa
    open var damageRelations: PKMTypeRelations?
    
    /// A list of game indices relevent to this item by generation
    open var gameIndices: [PKMGenerationGameIndex]?
    
    /// The generation this type was introduced in
    open var generation: PKMNamedAPIResource?
    
    /// The class of damage inflicted by this type
    open var moveDamageClass: PKMNamedAPIResource?
    
    /// The name of this type listed in different languages
    open var names: [PKMName]?
    
    /// A list of details of Pokémon that have this type
    open var pokemon: [PKMTypePokemon]?
    
    /// A list of moves that have this type
    open var moves: [PKMNamedAPIResource]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Nature Affect Set
open class PKMNatureStatAffectSets: Codable {
    
    /// A list of natures and how they change the referenced stat
    open var increase: [PKMNatureStatAffect]?
    
    /// A list of nature sand how they change the referenced stat
    open var decrease: [PKMNatureStatAffect]?
}


/// Nature Stat Affect
open class PKMNatureStatAffect: Codable {
    
    /// The maximum amount of change to the referenced stat
    open var maxChange: Int?
    
    /// The nature causing the change
    open var nature: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Move Stat Affect
open class PKMMoveStatAffect: Codable {
    
    /// The maximum amount of change to the referenced stat
    open var maxChange: Int?
    
    /// The move causing the change
    open var move: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Move Stat Affect Sets
open class PKMMoveStatAffectSets: Codable {
    
    /// A list of natures and how they change the referenced stat
    open var increase: [PKMMoveStatAffect]?
    
    /// A list of nature sand how they change the referenced stat
    open var decrease: [PKMMoveStatAffect]?
}

/// Stats determine certain aspects of battles. Each Pokémon has a value for each stat which grows as they gain levels and can be altered momentarily by effects in battles.
open class PKMStat: Codable {
    
    /// The identifier for this stat resource
    open var id: Int?
    
    /// The name for this stat resource
    open var name: String?
    
    /// ID the games use for this stat
    open var gameIndex: Int?
    
    /// Whether this stat only exists within a battle
    open var isBattleOnly: Bool?
    
    /// A detail of moves which affect this stat positively or negatively
    open var affectingMoves: PKMMoveStatAffectSets?
    
    //// A detail of natures which affect this stat positively or negatively
    open var affectingNatures: PKMNatureStatAffectSets?
    
    /// A list of characteristics that are set on a Pokémon when its highest base stat is this stat
    open var characteristics: [PKMAPIResource]?
    
    /// The class of damage this stat is directly related to
    open var moveDamageClass: PKMNamedAPIResource?
    
    /// The name of this region listed in different languages
    open var names: [PKMName]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Pokemon Species Dex Entry
open class PKMPokemonSpeciesDexEntry: Codable {
    
    /// The index number within the Pokédex
    open var entryNumber: Int?
    
    /// The Pokédex the referenced Pokémon species can be found in
    open var name: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// PalPark Encounter Area
open class PKMPalParkEncounterArea: Codable {
    
    /// The base score given to the player when the referenced Pokémon is caught during a pal park run
    open var baseScore: Int?
    
    /// The base rate for encountering the referenced Pokémon in this pal park area
    open var rate: Int?
    
    /// The pal park area where this encounter happens
    open var area: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Pokemon Species Flavor Text
open class PKMPokemonSpeciesFlavorText: Codable {
    
    /// The localized flavor text for an API resource in a specific language
    open var flavorText: String?
    
    /// The language this name is in
    open var language: PKMNamedAPIResource?
    
    /// The version this flavor text entry is used in
    open var version: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Genus
open class PKMGenus: Codable {
    
    /// The localized genus for the referenced pokemon species
    open var genus: String?
    
    /// The language this genus is in
    open var language: PKMNamedAPIResource?
}

/// A Pokémon Species forms the basis for at least one Pokémon. Attributes of a Pokémon species are shared across all varieties of Pokémon within the species. A good example is Wormadam; Wormadam is the species which can be found in three different varieties, Wormadam-Trash, Wormadam-Sandy and Wormadam-Plant.
open class PKMPokemonSpecies: Codable {
    
    /// The identifier for this Pokémon species resource
    open var id: Int?
    
    /// The name for this Pokémon species resource
    open var name: String?
    
    /// The order in which species should be sorted. Based on National Dex order, except families are grouped together and sorted by stage.
    open var order: Int?
    
    /// The chance of this Pokémon being female, in eighths; or -1 for genderless
    open var genderRate: Int?
    
    /// The base capture rate; up to 255. The higher the number, the easier the catch.
    open var captureRate: Int?
    
    /// The happiness when caught by a normal Pokéball; up to 255. The higher the number, the happier the Pokémon.
    open var baseHappiness: Int?
    
    /// Whether or not this is a baby Pokémon
    open var isBaby: Bool?
    
    /// Initial hatch counter: one must walk 255 × (hatch_counter + 1) steps before this Pokémon's egg hatches, unless utilizing bonuses like Flame Body's
    open var hatchCounter: Int?
    
    /// Whether or not this Pokémon can have different genders
    open var hasGenderDifferences: Bool?
    
    /// Whether or not this Pokémon has multiple forms and can switch between them
    open var formsSwitchable: Bool?
    
    /// The rate at which this Pokémon species gains levels
    open var growthRate: PKMNamedAPIResource?
    
    /// A list of pokedexes and the indexes reserved within them for this Pokémon species
    open var pokedexNumbers: [PKMPokemonSpeciesDexEntry]?
    
    /// A list of egg groups this Pokémon species is a member of
    open var eggGroups: [PKMNamedAPIResource]?
    
    /// The color of this Pokémon for gimmicky Pokédex search
    open var color: PKMNamedAPIResource?
    
    /// The shape of this Pokémon for gimmicky Pokédex search
    open var shape: PKMNamedAPIResource?
    
    /// The Pokémon species that evolves into this pokemon_species
    open var evolvesFromSpecies: PKMNamedAPIResource?
    
    /// The evolution chain this Pokémon species is a member of
    open var evolutionChain: PKMAPIResource?
    
    /// The habitat this Pokémon species can be encountered in
    open var habitat: PKMNamedAPIResource?
    
    /// The generation this Pokémon species was introduced in
    open var generation: PKMNamedAPIResource?
    
    /// The name of this Pokémon species listed in different languages
    open var names: [PKMName]?
    
    /// A list of encounters that can be had with this Pokémon species in pal park
    open var palParkEncounters: [PKMPalParkEncounterArea]?
    
    /// The flavor text of this flavor text listed in different languages
    open var flavorTextEntries: [PKMPokemonSpeciesFlavorText]?
    
    /// Descriptions of different forms Pokémon take on within the Pokémon species
    open var formDescriptions: [PKMDescription]?
    
    /// The genus of this Pokémon species listed in multiple languages
    open var genera: [PKMGenus]?
    
    /// A list of the Pokémon that exist within this Pokémon species
    open var varieties: [PKMNamedAPIResource]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// An Awesome Name
open class PKMAwesomeName: Codable {
    
    /// The localized "scientific" name for an API resource in a specific language
    open var awesomeName: String?
    
    /// The language this "scientific" name is in
    open var language: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Shapes used for sorting Pokémon in a Pokédex.
open class PKMPokemonShape: Codable {
    
    /// The identifier for this Pokémon shape
    open var id: Int?
    
    /// The name for this Pokémon shape resource
    open var name: String?
    
    /// The "scientific" name of this Pokémon shape listed in different languages
    open var awesomeNames: [PKMAwesomeName]?
    
    /// The name of this Pokémon shape listed in different languages
    open var names: [PKMName]?
    
    /// A list of the Pokémon species that have this shape
    open var pokemonSpecies: [PKMNamedAPIResource]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Habitats are generally different terrain Pokémon can be found in but can also be areas designated for rare or legendary Pokémon.
open class PKMPokemonHabitat: Codable {
    
    /// The identifier for this Pokémon habitat resource
    open var id: Int?
    
    /// The name for this Pokémon habitat resource
    open var name: String?
    
    /// The name of this Pokémon habitat listed in different languages
    open var names: [PKMName]?
    
    /// A list of the Pokémon species that can be found in this habitat
    open var pokemonSpecies: [PKMNamedAPIResource]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Pokemon Form Sprites
open class PKMPokemonFormSprites: Codable {
    
    /// The default depiction of this Pokémon form from the front in battle
    open var frontDefault: String?
    
    /// The shiny depiction of this Pokémon form from the front in battle
    open var frontShiny: String?
    
    /// The default depiction of this Pokémon form from the back in battle
    open var backDefault: String?
    
    /// The shiny depiction of this Pokémon form from the back in battle
    open var backShiny: String?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Some Pokémon have the ability to take on different forms. At times, these differences are purely cosmetic and have no bearing on the difference in the Pokémon's stats from another; however, several Pokémon differ in stats (other than HP), type, and Ability depending on their form.
open class PKMPokemonForm: Codable {
    
    /// The identifier for this Pokémon form resource
    open var id: Int?
    
    /// The name for this Pokémon form resource
    open var name: String?
    
    /// The order in which forms should be sorted within all forms. Multiple forms may have equal order, in which case they should fall back on sorting by name.
    open var order: Int?
    
    /// The order in which forms should be sorted within a species' forms
    open var formOrder: Int?
    
    /// True for exactly one form used as the default for each Pokémon
    open var isDefault: Bool?
    
    /// Whether or not this form can only happen during battle
    open var isBattleOnly: Bool?
    
    /// Whether or not this form requires mega evolution
    open var isMega: Bool?
    
    /// The name of this form
    open var formName: String?
    
    /// The Pokémon that can take on this form
    open var pokemon: PKMNamedAPIResource?
    
    /// A set of sprites used to depict this Pokémon form in the game
    open var sprites: PKMPokemonFormSprites?
    
    /// The version group this Pokémon form was introduced in
    open var versionGroup: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Colors used for sorting Pokémon in a Pokédex. The color listed in the Pokédex is usually the color most apparent or covering each Pokémon's body. No orange category exists; Pokémon that are primarily orange are listed as red or brown.
open class PKMPokemonColor: Codable {
    
    /// The identifier for this Pokémon color resource
    open var id: Int?
    
    /// The name for this Pokémon color resource
    open var name: String?
    
    /// The name of this Pokémon color listed in different languages
    open var names: [PKMName]?
    
    /// A list of the Pokémon species that have this color
    open var pokemonSpecies: [PKMNamedAPIResource]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Version Game Index
open class PKMVersionGameIndex: Codable {
    
    /// The internal id of an API resource within game data
    open var gameIndex: Int?
    
    /// The version relevent to this game index
    open var version: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Pokemon Ability
open class PKMPokemonAbility: Codable {
    
    /// Whether or not this is a hidden ability
    open var isHidden: Bool?
    
    /// The slot this ability occupies in this Pokémon species
    open var slot: Int?
    
    /// The ability the Pokémon may have
    open var ability: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Location Area Encounter
open class PKMLocationAreaEncounter: Codable {
    
    /// The location area the referenced Pokémon can be encountered in
    open var locationArea: PKMAPIResource?
    
    /// A list of versions and encounters with the referenced Pokémon that might happen
    open var versionDetails: [PKMVersionEncounterDetail]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Pokemon Sprites
open class PKMPokemonSprites: Codable {
    
    /// The default depiction of this Pokémon from the front in battle
    open var frontDefault: String?
    
    /// The shiny depiction of this Pokémon from the front in battle
    open var frontShiny: String?
    
    /// The female depiction of this Pokémon from the front in battle
    open var frontFemale: String?
    
    /// The shiny female depiction of this Pokémon from the front
    open var frontShinyFemale: String?
    
    /// The default depiction of this Pokémon from the back in battle
    open var backDefault: String?
    
    /// The shiny depiction of this Pokémon from the back in battle
    open var backShiny: String?
    
    /// The female depiction of this Pokémon from the back in battle
    open var backFemale: String?
    
    /// The shiny female depiction of this Pokémon from the back in battle
    open var backShinyFemale: String?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Pokemon Type
open class PKMPokemonType: Codable {
    
    /// The order the Pokémon's types are listed in
    open var slot: Int?
    
    /// The type the referenced Pokémon has
    open var type: String?
}

/// Pokémon are the creatures that inhabit the world of the Pokémon games. They can be caught using Pokéballs and trained by battling with other Pokémon. See Bulbapedia for greater detail.
open class PKMPokemon: Codable {
    
    /// The identifier for this Pokémon resource
    open var id: Int?
    
    /// The name for this Pokémon resource
    open var name: String?
    
    /// The base experience gained for defeating this Pokémon
    open var base_experience: Int?
    
    /// The height of this Pokémon
    open var height: Int?
    
    /// Set for exactly one Pokémon used as the default for each species
    open var isDefault: Bool?
    
    /// Order for sorting. Almost national order, except families are grouped together.
    open var order: Int?
    
    /// The weight of this Pokémon
    open var weight: Int?
    
    /// A list of abilities this Pokémon could potentially have
    open var abilities: [PKMPokemonAbility]?
    
    /// A list of forms this Pokémon can take on
    open var forms: [PKMNamedAPIResource]?
    
    /// A list of game indices relevent to Pokémon item by generation
    open var gameIndices: [PKMVersionGameIndex]?
    
    /// A list of items this Pokémon may be holding when encountered
    open var heldItems: [PKMNamedAPIResource]?
    
    /// A list of location areas as well as encounter details pertaining to specific versions
    open var locationAreaEncounters: [PKMLocationAreaEncounter]?
    
    /// A list of moves along with learn methods and level details pertaining to specific version groups
    open var moves: [PKMNamedAPIResource]?
    
    /// A set of sprites used to depict this Pokémon in the game
    open var sprites: PKMPokemonSprites?
    
    /// The species this Pokémon belongs to
    open var species: PKMNamedAPIResource?
    
    /// A list of base stat values for this Pokémon
    open var stats: [PKMNamedAPIResource]?
    
    /// A list of details showing types this Pokémon has
    open var types: [PKMPokemonType]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Nature Pokeathlon Stat Affect
open class PKMNaturePokeathlonStatAffect: Codable {
    
    /// The maximum amount of change to the referenced Pokéathlon stat
    open var maxChange: Int?
    
    /// The nature causing the change
    open var nature: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Nature Pokeathlon Stat Affect Sets
open class PKMNaturePokeathlonStatAffectSets: Codable {
    
    /// A list of natures and how they change the referenced Pokéathlon stat
    open var increase: [PKMNaturePokeathlonStatAffect]?
    
    /// A list of natures and how they change the referenced Pokéathlon stat
    open var decrease: [PKMNaturePokeathlonStatAffect]?
}

/// Pokeathlon Stats are different attributes of a Pokémon's performance in Pokéathlons. In Pokéathlons, competitions happen on different courses; one for each of the different Pokéathlon stats. See Bulbapedia for greater detail.
open class PKMPokeathlonStat: Codable {
    
    /// The identifier for this Pokéathlon stat resource
    open var id: Int?
    
    /// The name for this Pokéathlon stat resource
    open var name: String?
    
    /// The name of this Pokéathlon stat listed in different languages
    open var names: [PKMName]?
    
    /// A detail of natures which affect this Pokéathlon stat positively or negatively
    open var affectingNatures: PKMNaturePokeathlonStatAffectSets?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Move Battle Style Preference
open class PKMMoveBattleStylePreference: Codable {
    
    /// Chance of using the move, in percent, if HP is under one half
    open var lowHpPreference: Int?
    
    /// Chance of using the move, in percent, if HP is over one half
    open var highHpPreference: Int?
    
    /// The move battle style
    open var moveBattleStyle: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/*
change	The amount of change	integer
stat	The stat being affected	NamedAPIResource (PokeathlonStat)
*/
open class PKMNatureStatChange: Codable {
    open var maxChange: Int?
    open var pokeathlonStat: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Natures influence how a Pokémon's stats grow. See Bulbapedia ( http://bulbapedia.bulbagarden.net/wiki/Nature ) for greater detail.
open class PKMNature: Codable {
    
    /// The identifier for this nature resource
    open var id: Int?
    
    /// The name for this nature resource
    open var name: String?
    
    /// The stat decreased by 10% in Pokémon with this nature
    open var decreasedStat: PKMNamedAPIResource?
    
    /// The stat increased by 10% in Pokémon with this nature
    open var increasedStat: PKMNamedAPIResource?
    
    /// The flavor hated by Pokémon with this nature
    open var hatesFlavor: PKMNamedAPIResource?
    
    /// he flavor liked by Pokémon with this nature
    open var likesFlavor: PKMNamedAPIResource?
    
    /// A list of Pokéathlon stats this nature effects and how much it effects them
    open var pokeathlonStatChanges: [PKMNatureStatChange]?
    
    /// A list of battle styles and how likely a Pokémon with this nature is to use them in the Battle Palace or Battle Tent.
    open var moveBattleStylePreferences: [PKMMoveBattleStylePreference]?
    
    /// The name of this nature listed in different languages
    open var names: [PKMName]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/*
level	The level gained	integer
experience	The amount of experience required to reach the referenced level	integer
*/

/// Growth Rate Experience Level
open class PKMGrowthRateExperienceLevel: Codable {
    
    /// The level gained
    open var level: Int?
    
    /// The amount of experience required to reach the referenced level
    open var experience: Int?
}



/// Growth rates are the speed with which Pokémon gain levels through experience. Check out Bulbapedia ( http://bulbapedia.bulbagarden.net/wiki/Experience ) for greater detail.
open class PKMGrowthRate: Codable {
    
    /// The identifier for this gender resource
    open var id: Int?
    
    /// The name for this gender resource
    open var name: String?
    
    /// The formula used to calculate the rate at which the Pokémon species gains level
    open var formula: String?
    
    /// The descriptions of this characteristic listed in different languages
    open var descriptions: [PKMDescription]?
    
    /// A list of levels and the amount of experienced needed to atain them based on this growth rate
    open var levels: [PKMGrowthRateExperienceLevel]?
    
    /// A list of Pokémon species that gain levels at this growth rate
    open var pokemonSpecies: [PKMNamedAPIResource]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



/// Pokemon Species Gender
open class PKMPokemonSpeciesGender: Codable {
    
    /// The chance of this Pokémon being female, in eighths; or -1 for genderless
    open var rate: Int?
    
    /// A Pokémon species that can be the referenced gender
    open var pokemonSpecies: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Genders were introduced in Generation II for the purposes of breeding Pokémon but can also result in visual differences or even different evolutionary lines. Check out Bulbapedia for greater detail.
open class PKMGender: Codable {
    
    /// The identifier for this gender resource
    open var id: Int?
    
    /// The name for this gender resource
    open var name: String?
    
    /// A list of Pokémon species that can be this gender and how likely it is that they will be
    open var pokemonSpeciesDetails: [PKMPokemonSpeciesGender]?
    
    /// A list of Pokémon species that required this gender in order for a Pokémon to evolve into them
    open var requiredForEvolution: [PKMNamedAPIResource]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Egg Groups are categories which determine which Pokémon are able to interbreed. Pokémon may belong to either one or two Egg Groups. Check out Bulbapedia for greater detail.
open class PKMEggGroup: Codable {
    
    /// The identifier for this egg group resource
    open var id: Int?
    
    /// The name for this egg group resource
    open var name: String?
    
    /// The name of this egg group listed in different languages
    open var names: [PKMName]?
    
    /// A list of all Pokémon species that are members of this egg group
    open var pokemonSpecies: [PKMNamedAPIResource]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Characteristics indicate which stat contains a Pokémon's highest IV. A Pokémon's Characteristic is determined by the remainder of its highest IV divided by 5 (gene_modulo). Check out Bulbapedia for greater detail.
open class PKMCharacteristic: Codable {
    
    /// The identifier for this characteristic resource
    open var id: Int?
    
    /// The remainder of the highest stat/IV divided by 5
    open var geneModulo: Int?
    
    /// The possible values of the highest stat that would result in a Pokémon recieving this characteristic when divided by 5
    open var possibleValues: [Int]?
    
    /// The descriptions of this characteristic listed in different languages
    open var descriptions: [PKMDescription]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Ability Pokemon
open class PKMAbilityPokemon: Codable {
    
    /// Whether or not this a hidden ability for the referenced Pokémon
    open var isHidden: Bool?
    
    /// Pokémon have 3 ability 'slots' which hold references to possible abilities they could have. This is the slot of this ability for the referenced pokemon.
    open var slot: Int?
    
    /// The Pokémon this ability could belong to
    open var pokemon: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Abilities provide passive effects for Pokémon in battle or in the overworld. Pokémon have mutiple possible abilities but can have only one ability at a time. Check out Bulbapedia for greater detail.
open class PKMAbility: Codable {
    
    /// The identifier for this ability resource
    open var id: Int?
    
    /// The name for this ability resource
    open var name: String?
    
    /// Whether or not this ability originated in the main series of the video games
    open var isMainSeries: Bool?
    
    /// The generation this ability originated in
    open var generation: PKMNamedAPIResource?
    
    /// The name of this ability listed in different languages
    open var names: [PKMName]?
    
    /// The effect of this ability listed in different languages
    open var effectEntries: [PKMVerboseEffect]?
    
    /// The list of previous effects this ability has had across version groups
    open var effectChanges: [PKMAbilityEffectChange]?
    
    /// The flavor text of this ability listed in different languages
    open var flavorTextEntries: [PKMVersionGroupFlavorText]?
    
    /// A list of Pokémon that could potentially have this ability
    open var pokemon: [PKMAbilityPokemon]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// A region is an organized area of the Pokémon world. Most often, the main difference between regions is the species of Pokémon that can be encountered within them.
open class PKMRegion: Codable {
    
    /// The identifier for this region resource
    open var id: Bool?
    
    /// The name for this region resource
    open var name: String?
    
    /// A list of locations that can be found in this region
    open var locations: [PKMNamedAPIResource]?
    
    /// The generation this region was introduced in
    open var mainGeneration: [PKMNamedAPIResource]?
    
    /// The name of this region listed in different languages
    open var names: [PKMName]?
    
    /// A list of pokédexes that catalogue Pokémon in this region
    open var pokedexes: [PKMNamedAPIResource]?
    
    /// A list of version groups where this region can be visited
    open var versionGroups: [PKMNamedAPIResource]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Areas used for grouping Pokémon encounters in Pal Park. They're like habitats that are specific to Pal Park.
open class PKMPalParkEncounterSpecies: Codable {
    
    /// The base score given to the player when this Pokémon is caught during a pal park run
    open var baseScore: Int?
    
    /// The base rate for encountering this Pokémon in this pal park area
    open var rate: Int?
    
    /// The Pokémon species being encountered
    open var pokemonSpecies: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Pal Park Area
open class PKMPalParkArea: Codable {
    
    /// The identifier for this pal park area resource
    open var id: Int?
    
    /// The name for this pal park area resource
    open var name: String?
    
    /// The name of this pal park area listed in different languages
    open var names: [PKMName]?
    
    /// A list of Pokémon encountered in thi pal park area along with details
    open var pokemonEncounters: [PKMPalParkEncounterSpecies]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Locations that can be visited within the games. Locations make up sizable portions of regions, like cities or routes.
open class PKMLocation: Codable {
    
    /// The identifier for this location resource
    open var id: Int?
    
    /// The name for this location resource
    open var name: String?
    
    /// The region this location can be found in
    open var region: PKMNamedAPIResource?
    
    /// The name of this language listed in different languages
    open var names: [PKMName]?
    
    /// A list of game indices relevent to this location by generation
    open var gameIndices: [PKMGenerationGameIndex]?
    
    /// Areas that can be found within this location
    open var areas: PKMAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Encounter
open class PKMEncounter: Codable {
    
    /// The lowest level the Pokémon could be encountered at
    open var minLevel: Int?
    
    /// The highest level the Pokémon could be encountered at
    open var maxLevel: Int?
    
    /// A list of condition values that must be in effect for this encounter to occur
    open var conditionValues: [PKMNamedAPIResource]?
    
    /// percent chance that this encounter will occur
    open var chance: Int?
    
    /// The method by which this encounter happens
    open var method: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Version Encounter Detail
open class PKMVersionEncounterDetail: Codable {
    
    /// The game version this encounter happens in
    open var version: PKMNamedAPIResource?
    
    /// The total percentage of all encounter potential
    open var maxChance: Int?
    
    /// A list of encounters and their specifics
    open var encounterDetails: [PKMEncounter]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Pokemon Encounter
open class PKMPokemonEncounter: Codable {
    
    /// The Pokémon being encountered
    open var pokemon: PKMNamedAPIResource?
    
    /// A list of versions and encounters with Pokémon that might happen in the referenced location area
    open var versionDetails: [PKMVersionEncounterDetail]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Encounter Version Details
open class PKMEncounterVersionDetails: Codable {
    
    /// The chance of an encounter to occur.
    open var rate: Int?
    
    /// The version of the game in which the encounter can occur with the given chance.
    open var version: PKMNamedAPIResource?
}

/// Encounter Method Rate
open class PKMEncounterMethodRate: Codable {
    
    /// The method in which Pokémon may be encountered in an area.
    open var encounterEethod: PKMEncounterMethod?
    
    /// The chance of the encounter to occur on a version of the game.
    open var versionDetails: [PKMEncounterVersionDetails]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Location areas are sections of areas, such as floors in a building or cave. Each area has its own set of possible Pokémon encounters.
open class PKMLocationArea: Codable {
    
    /// The identifier for this location resource
    open var id: Int?
    
    /// The name for this location resource
    open var name: String?
    
    /// The internal id of an API resource within game data
    open var gameIndex: Int?
    
    /// A list of methods in which Pokémon may be encountered in this area and how likely the method will occur depending on the version of the game
    open var encounterMethodRates: [PKMEncounterMethodRate]?
    
    /// The region this location can be found in
    open var location: PKMNamedAPIResource?
    
    /// The name of this location area listed in different languages
    open var names: [PKMName]?
    
    /// A list of Pokémon that can be encountered in this area along with version specific details about the encounter
    open var pokemonEncounters: [PKMPokemonEncounter]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Targets moves can be directed at during battle. Targets can be Pokémon, environments or even other moves.
open class PKMMoveTarget: Codable {
    
    /// The identifier for this move target resource
    open var id: Int?
    
    /// The name for this move target resource
    open var name: String?
    
    /// The description of this move target listed in different languages
    open var descriptions: [PKMDescription]?
    
    /// A list of moves that that are directed at this target
    open var moves: [PKMNamedAPIResource]?
    
    /// The name of this move target listed in different languages
    open var names: [PKMName]?
}

/// Methods by which Pokémon can learn moves.
open class PKMMoveLearnMethod: Codable {
    
    /// The identifier for this move learn method resource
    open var id: Int?
    
    /// The name for this move learn method resource
    open var name: String?
    
    /// The description of this move learn method listed in different languages
    open var descriptions: [PKMDescription]?
    
    /// The name of this move learn method listed in different languages
    open var names: [PKMName]?
    
    /// A list of version groups where moves can be learned through this method
    open var versionGroups: [PKMNamedAPIResource]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Damage classes moves can have, e.g. physical, special, or non-damaging.
open class PKMMoveDamageClass: Codable {
    
    /// The identifier for this move damage class resource
    open var id: Int?
    
    /// The name for this move damage class resource
    open var name: String?
    
    /// The description of this move damage class listed in different languages
    open var descriptions: [PKMDescription]?
    
    /// A list of moves that fall into this damage class
    open var moves: [PKMNamedAPIResource]?
    
    /// The name of this move damage class listed in different languages
    open var names: [PKMName]?
}

/// Very general categories that loosely group move effects.
open class PKMMoveCategory: Codable {
    
    /// The identifier for this move category resource
    open var id: Int?
    
    /// The name for this move category resource
    open var name: String?
    
    /// A list of moves that fall into this category
    open var moves: [PKMNamedAPIResource]?
    
    /// The description of this move ailment listed in different languages
    open var descriptions: [PKMDescription]?
}

/// Styles of moves when used in the Battle Palace. See Bulbapedia for greater detail.
open class PKMMoveBattleStyle: Codable {
    
    /// The identifier for this move battle style resource
    open var id: Int?
    
    /// The name for this move battle style resource
    open var name: String?
    
    /// The name of this move battle style listed in different languages
    open var names: [PKMName]?
}

/// Move Ailments are status conditions caused by moves used during battle. See Bulbapedia for greater detail.
open class PKMMoveAilment: Codable {
    
    /// The identifier for this move ailment resource
    open var id: Int?
    
    /// The name for this move ailment resource
    open var name: String?
    
    /// A list of moves that cause this ailment
    open var moves: [PKMNamedAPIResource]?
    
    /// The name of this move ailment listed in different languages
    open var names: [PKMName]?
}

/// Move Stat Change
open class PKMMoveStatChange: Codable {
    
    /// The amount of change
    open var change: Int?
    
    /// The stat being affected
    open var stat: PKMNamedAPIResource?
}

/// Past Move Stat Values
open class PKMPastMoveStatValues: Codable {
    
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
    open var type: PKMNamedAPIResource?
    
    /// The version group in which these move stat values were in effect
    open var versionGroup: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Move Meta Data
open class PKMMoveMetaData: Codable {
    
    /// The status ailment this move inflicts on its target
    open var ailment: PKMNamedAPIResource?
    
    /// The category of move this move falls under, e.g. damage or ailment
    open var category: PKMNamedAPIResource?
    
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
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Ability Effect Change
open class PKMAbilityEffectChange: Codable {
    
    /// The previous effect of this ability listed in different languages
    open var effectEntries: PKMEffect?
    
    /// The version group in which the previous effect of this ability originated
    open var versionGroup: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Contest Combo Detail
open class PKMContestComboDetail: Codable {
    
    /// A list of moves to use before this move
    open var useBefore: [PKMNamedAPIResource]?
    
    /// A list of moves to use after this move
    open var useAfter: [PKMNamedAPIResource]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Contest Combo Sets
open class PKMContestComboSets: Codable {
    
    /// A detail of moves this move can be used before or after, granting additional appeal points in contests
    open var normal: [PKMContestComboDetail]?
    
    /// A detail of moves this move can be used before or after, granting additional appeal points in super contests
    open var `super`: [PKMContestComboDetail]?
}

/// Moves are the skills of Pokémon in battle. In battle, a Pokémon uses one move each turn. Some moves (including those learned by Hidden Machine) can be used outside of battle as well, usually for the purpose of removing obstacles or exploring new areas.
open class PKMMove: Codable {
    
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
    open var contestCombos: [PKMContestComboSets]?
    
    /// The type of appeal this move gives a Pokémon when used in a contest
    open var contestType: PKMNamedAPIResource?
    
    /// The effect the move has when used in a contest
    open var contestEffect: PKMNamedAPIResource?
    
    /// The type of damage the move inflicts on the target, e.g. physical
    open var damageClass: PKMNamedAPIResource?
    
    /// The effect of this move listed in different languages
    open var effectEntries: [PKMVerboseEffect]?
    
    /// The list of previous effects this move has had across version groups of the games
    open var effectChanges: [PKMAbilityEffectChange]?
    
    /// The generation in which this move was introduced
    open var generation: PKMNamedAPIResource?
    
    /// Metadata about this move
    open var meta: PKMMoveMetaData?
    
    /// The name of this move listed in different languages
    open var names: [PKMName]?
    
    /// A list of move resource value changes across ersion groups of the game
    open var pastValues: [PKMPastMoveStatValues]?
    
    /// A list of stats this moves effects and how much it effects them
    open var statChanges: [PKMMoveStatChange]?
    
    /// The effect the move has when used in a super contest
    open var superContestEffect: PKMAPIResource?
    
    /// The type of target that will recieve the effects of the attack
    open var target: PKMNamedAPIResource?
    
    /// The elemental type of this move	NamedAPIResource
    open var type: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Pockets within the players bag used for storing items by category.
open class PKMItemPocket: Codable {
    
    /// The identifier for this item pocket resource
    open var id: Int?
    
    /// The name for this item pocket resource
    open var name: String?
    
    /// A list of item categories that are relevent to this item pocket
    open var categories: [PKMNamedAPIResource]?
    
    /// The name of this item pocket listed in different languages
    open var names: [PKMName]?
}

/// Effect
open class PKMEffect: Codable {
    
    /// The localized effect text for an API resource in a specific language
    open var effect: String?
    
    /// The language this effect is in
    open var language: PKMNamedAPIResource?
}

/// The various effects of the move "Fling" when used with different items.
open class PKMItemFlingEffect: Codable {
    
    /// The identifier for this fling effect resource
    open var id: Int?
    
    /// The name for this fling effect resource
    open var name: String?
    
    /// The result of this fling effect listed in different languages
    open var effectEntries: [PKMEffect]?
    
    /// A list of items that have this fling effect	list
    open var items: [PKMNamedAPIResource]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Item categories determine where items will be placed in the players bag.
open class PKMItemCategory: Codable {
    
    /// The identifier for this item category resource
    open var id: Int?
    
    /// The name for this item category resource
    open var name: String?
    
    /// A list of items that are a part of this category
    open var items: [PKMNamedAPIResource]?
    
    /// The name of this item category listed in different languages
    open var names: [PKMName]?
    
    /// The pocket items in this category would be put in
    open var pocket: PKMNamedAPIResource?
}

/// Item attributes define particular aspects of items, e.g. "usable in battle" or "consumable".
open class PKMItemAttribute: Codable {
    
    /// The identifier for this item attribute resource
    open var id: Int?
    
    /// The name for this item attribute resource
    open var name: String?
    
    /// A list of items that have this attribute
    open var items: [PKMNamedAPIResource]?
    
    /// The name of this item attribute listed in different languages
    open var names: [PKMName]?
    
    /// The description of this item attribute listed in different languages
    open var descriptions: [PKMDescription]?
}

/// Verbose Effect
open class PKMVerboseEffect: Codable {
    
    /// The localized effect text for an API resource in a specific language
    open var effect: String?
    
    /// The localized effect text in brief
    open var shortEffect: String?
    
    /// The language this effect is in
    open var language: Bool?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Version Group Flavor Text
open class PKMVersionGroupFlavorText: Codable {
    
    /// The localized name for an API resource in a specific language
    open var text: String?
    
    /// The language this name is in
    open var language: PKMNamedAPIResource?
    
    /// The version group which uses this flavor text
    open var versionGroup: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Generation Game Index
open class PKMGenerationGameIndex: Codable {
    
    /// The internal id of an API resource within game data
    open var gameIndex: Int?
    
    /// The generation relevent to this game index
    open var generation: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Item Sprites
open class PKMItemSprites: Codable {
    /// The default depiction of this item
    open var `default`: String?
}


/// API Referenced Resource
open class PKMAPIResource: Codable {
    /// The URL of the referenced resource
    open var url: String?
}

/// An item is an object in the games which the player can pick up, keep in their bag, and use in some manner. They have various uses, including healing, powering up, helping catch Pokémon, or to access a new area.
open class PKMItem: Codable {
    
    /// The identifier for this item resource
    open var id: Int?
    
    /// The name for this item resource
    open var name: String?
    
    /// The price of this item in stores
    open var cost: Int?
    
    /// The power of the move Fling when used with this item.
    open var flingPower: Int?
    
    /// The effect of the move Fling when used with this item
    open var flingEffect: PKMNamedAPIResource?
    
    /// A list of attributes this item has
    open var attributes: [PKMNamedAPIResource]?
    
    /// The category of items this item falls into
    open var category: PKMNamedAPIResource?
    
    /// The effect of this ability listed in different languages
    open var effectEntries: [PKMVerboseEffect]?
    
    /// The flavor text of this ability listed in different languages
    open var flavorTextEntries: [PKMVersionGroupFlavorText]?
    
    /// A list of game indices relevent to this item by generation
    open var gameIndices: [PKMGenerationGameIndex]?
    
    /// The name of this item listed in different languages
    open var names: [PKMName]?
    
    /// A set of sprites used to depict this item in the game
    open var sprites: PKMItemSprites?
    
    /// A list of Pokémon that might be found in the wild holding this item
    open var heldByPokemon: [PKMNamedAPIResource]?
    
    /// An evolution chain this item requires to produce a bay during mating
    open var babyTriggerFor: [PKMAPIResource]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Version groups categorize highly similar versions of the games.
open class PKMVersionGroup: Codable {
    
    /// The identifier for this version group resource
    open var id: Int?
    
    /// The name for this version group resource
    open var name: String?
    
    /// Order for sorting. Almost by date of release, except similar versions are grouped together.
    open var order: Int?
    
    /// The generation this version was introduced in
    open var generation: [PKMNamedAPIResource]?
    
    /// A list of methods in which Pokémon can learn moves in this version group
    open var moveLearnMethods: [PKMNamedAPIResource]?
    
    /// The name of this version group listed in different languages
    open var names: [PKMName]?
    
    /// A list of Pokédexes introduces in this version group
    open var pokedexes: [PKMNamedAPIResource]?
    
    /// A list of regions that can be visited in this version group	list
    open var regions: [PKMNamedAPIResource]?
    
    /// The versions this version group owns
    open var versions: [PKMNamedAPIResource]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Versions of the games, e.g., Red, Blue or Yellow.
open class PKMVersion: Codable {
    
    /// The identifier for this version resource
    open var id: Int?
    
    /// The name for this version resource
    open var name: String?
    
    /// The name of this version listed in different languages
    open var names: [PKMName]?
    
    /// The version group this version belongs to
    open var versionGroup: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Description
open class PKMDescription: Codable {
    
    /// The localized description for an API resource in a specific language
    open var description: String?
    
    /// The language this name is in
    open var language: PKMNamedAPIResource?
}

/// Entry
open class PKMEntry: Codable {
    
    /// The index of this pokemon species entry within the Pokédex
    open var entryNumber: Int?
    
    /// The Pokémon species being encountered
    open var pokemonSpecies: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// A Pokédex is a handheld electronic encyclopedia device; one which is capable of recording and retaining information of the various Pokémon in a given region with the exception of the national dex and some smaller dexes related to portions of a region. See Bulbapedia for greater detail.
open class PKMPokedex: Codable {
    
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
    open var pokemonEntries: [PKMEntry]?
    
    /// The region this Pokédex catalogues pokemon for
    open var region: PKMNamedAPIResource?
    
    /// A list of version groups this Pokédex is relevent to
    open var versionGroups: [PKMNamedAPIResource]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// A generation is a grouping of the Pokémon games that separates them based on the Pokémon they include. In each generation, a new set of Pokémon, Moves, Abilities and Types that did not exist in the previous generation are released.
open class PKMGeneration: Codable {
    
    /// The identifier for this generation resource
    open var id: Int?
    
    /// The name for this generation resource
    open var name: String?
    
    /// The name of this generation listed in different languages
    open var names: [PKMName]?
    
    /// A list of abilities that were introduced in this generation
    open var abilities: [PKMNamedAPIResource]?
    
    /// The main region travelled in this generation
    open var mainRegion: PKMNamedAPIResource?
    
    /// A list of moves that were introduced in this generation
    open var moves: [PKMNamedAPIResource]?
    
    /// A list of Pokémon species that were introduced in this generation
    open var pokemonSpecies: [PKMNamedAPIResource]?
    
    /// A list of types that were introduced in this generation
    open var types: [PKMNamedAPIResource]?
    
    /// A list of version groups that were introduced in this generation
    open var versionGroups: [PKMNamedAPIResource]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Evolution triggers are the events and conditions that cause a pokemon to evolve. Check out Bulbapedia for greater detail.
open class PKMEvolutionTrigger: Codable {
    
    /// The identifier for this evolution trigger resource
    open var id: Int?
    
    /// The name for this evolution trigger resource
    open var name: String?
    
    /// The name of this evolution trigger listed in different languages
    open var names: [PKMName]?
    
    /// A list of pokemon species that result from this evolution trigger
    open var pokemonSpecies: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Evolution Detail
open class PKMEvolutionDetail: Codable {
    
    /// The item required to cause evolution this into Pokémon species
    open var item: PKMNamedAPIResource?
    
    /// The type of event that triggers evolution into this Pokémon species
    open var trigger: PKMNamedAPIResource?
    
    /// The gender the evolving Pokémon species must be in order to evolve into this Pokémon species
    open var gender: PKMNamedAPIResource?
    
    /// The item the evolving Pokémon species must be holding during the evolution
    open var heldItem: PKMNamedAPIResource?
    
    /// The move that must be known by the evolving Pokémon species during the evolution trigger event in order to evolve into this Pokémon species
    open var knownMove: PKMNamedAPIResource?
    
    /// The evolving Pokémon species must know a move with this type during the evolution trigger event in order to evolve into this Pokémon species
    open var knownMoveType: PKMNamedAPIResource?
    
    /// The location the evolution must be triggered at.
    open var location: PKMNamedAPIResource?
    
    /// The minimum required level of the evolving Pokémon species to evolve into this Pokémon species
    open var minLevel: Int?
    
    /// The minimum required level of happiness the evolving Pokémon species to evolve into this Pokémon species
    open var minHappiness: Int?
    
    /// The minimum required level of beauty the evolving Pokémon species to evolve into this Pokémon species
    open var minBeauty: Int?
    
    /// The minimum required level of affection the evolving Pokémon species to evolve into this Pokémon species
    open var minAffection: Int?
    
    /// Whether or not it must be raining in the overworld to cause evolution this Pokémon species
    open var needsOverworldRain: Bool?
    
    /// The pokemon species that must be in the players party in order for the evolving Pokémon species to evolve into this Pokémon species
    open var partySpecies: PKMNamedAPIResource?
    
    /// The player must have a pokemon of this type in their party during the evolution trigger event in order for the evolving Pokémon species to evolve into this Pokémon species
    open var partyType: PKMNamedAPIResource?
    
    /// The required relation between the Pokémon's Attack and Defense stats. 1 means Attack > Defense. 0 means Attack = Defense. -1 means Attack < Defense.
    open var relativePhysicalStats: Int?
    
    /// The required time of day. Day or night.
    open var timeOfDay: String?
    
    /// Pokémon species for which this one must be traded.
    open var tradeSpecies: PKMNamedAPIResource?
    
    /// Whether or not the 3DS needs to be turned upside-down as this Pokémon levels up.
    open var turnUpsideDown: Bool?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Clain Link
open class PKMClainLink: Codable {
    
    /// Whether or not this link is for a baby Pokémon. This would only ever be true on the base link.
    open var isBaby: Bool?
    
    /// The Pokémon species at this point in the evolution chain
    open var species: PKMNamedAPIResource?
    
    /// All details regarding the specific details of the referenced Pokémon species evolution
    open var evolutionDetails: PKMEvolutionDetail?
    
    /// A List of chain objects.
    open var evolvesTo: [PKMClainLink]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Evolution Chain
open class PKMEvolutionChain: Codable {
    
    /// The identifier for this evolution chain resource
    open var id: Int?
    
    /// The item that a Pokémon would be holding when mating that would trigger the egg hatching a baby Pokémon rather than a basic Pokémon
    open var babyTriggerItem: PKMNamedAPIResource?
    
    /// The base chain link object. Each link contains evolution details for a Pokémon in the chain. Each link references the next Pokémon in the natural evolution order.
    open var chain: PKMClainLink?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Encounter Condition Value
open class PKMEncounterConditionValue: Codable {
    
    /// The identifier for this encounter condition value resource
    open var id: Int?
    
    /// The name for this encounter condition value resource
    open var name: String?
    
    /// The condition this encounter condition value pertains to
    open var condition: [PKMNamedAPIResource]?
    
    /// The name of this encounter condition value listed in different languages
    open var names: [PKMName]?
}

/// Encounter Condition
open class PKMEncounterCondition: Codable {
    
    /// The identifier for this encounter condition resource
    open var id: Int?
    
    /// The name for this encounter condition resource
    open var name: String?
    
    /// A list of possible values for this encounter condition
    open var values: [PKMNamedAPIResource]?
    
    /// The name of this encounter method listed in different languages
    open var names: [PKMName]?
}

/// Methods by which the player might can encounter Pokémon in the wild, e.g., walking in tall grass. Check out Bulbapedia for greater detail.
open class PKMEncounterMethod: Codable {
    
    /// The identifier for this encounter method resource
    open var id: Int?
    
    /// The name for this encounter method resource
    open var name: String?
    
    /// A good value for sorting
    open var order: Int?
    
    /// The name of this encounter method listed in different languages
    open var names: [PKMName]?
}

/// Super contest effects refer to the effects of moves when used in super contests.
open class PKMSuperContestEffect: Codable {
    
    /// The identifier for this super contest effect resource
    open var id: Int?
    
    /// The level of appeal this super contest effect has
    open var appeal: String?
    
    /// The flavor text of this super contest effect listed in different languages
    open var flavorTextEntries: [PKMFlavorText]?
    
    /// A list of moves that have the effect when used in super contests
    open var moves: [PKMNamedAPIResource]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Flavor Text
open class PKMFlavorText: Codable {
    
    /// The localized flavor text for an API resource in a specific language
    open var flavorText: String?
    
    /// The language this name is in
    open var language: PKMName?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Effect Entry
open class PKMEffectEntry: Codable {
    
    /// The localized effect text for an API resource in a specific language
    open var effect: String?
    
    /// The language this effect is in
    open var language: PKMName?
}

/// Contest effects refer to the effects of moves when used in contests.
open class PKMContestEffect: Codable {
    
    /// The identifier for this contest type resource
    open var id: Int?
    
    /// The base number of hearts the user of this move gets
    open var appeal: String?
    
    /// The base number of hearts the user's opponent loses
    open var jam: Int?
    
    /// The result of this contest effect listed in different languages
    open var effectEntries: [PKMEffectEntry]?
    
    /// The flavor text of this contest effect listed in different languages
    open var flavorTextEntries: [PKMFlavorText]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Contest types are categories judges used to weigh a Pokémon's condition in Pokémon contests. Check out Bulbapedia for greater detail.
open class PKMContestType: Codable {
    
    /// The identifier for this contest type resource
    open var id: Int?
    
    /// The name for this contest type resource
    open var name: String?
    
    /// The berry flavor that correlates with this contest type
    open var berryFlavor: PKMNamedAPIResource?
    
    /// The name of this contest type listed in different languages
    open var names: [PKMName]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Paged Object
open class PKMPagedObject: Codable{
    
    /// The total number of resources abailable from this API
    open var count: Int?
    
    /// The url for the next 'page' in the list
    open var next: String?
    
    /// The url for the previous page in the list
    open var previous: String?
    
    /// List of unnamed API resources
    open var results: [PKMNamedAPIResource]?
}

/// Name
open class PKMName: Codable{
    
    /// The localized name for an API resource in a specific language
    open var name: String?
    
    /// The language this name is in
    open var language: PKMNamedAPIResource?
}


/// Named API Resource
open class PKMNamedAPIResource: Codable{
    
    /// The name of the referenced resource
    open var name: String?
    
    /// The URL of the referenced resource
    open var url: String?
}

open class PKMBerryFlavorMap: Codable{
    
    /// How powerful the referenced flavor is for this berry
    open var potency: Int?
    
    /// The berry with the referenced flavor
    open var flavor: PKMNamedAPIResource?
}

/// Flavors determine whether a Pokémon will benefit or suffer from eating a berry based on their nature. Check out Bulbapedia for greater detail.
open class PKMBerryFlavor: Codable{
    
    /// The identifier for this berry flavor resource
    open var id: Int?
    
    /// The name for this berry flavor resource
    open var name: String?
    
    /// A list of the berries with this flavor
    open var berries: [PKMFlavorBerryMap]?
    
    /// The contest type that correlates with this berry flavor
    open var contestType: PKMNamedAPIResource?
    
    /// The name of this berry flavor listed in different languages
    open var names:[PKMName]?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Flavour Berry Map
open class PKMFlavorBerryMap: Codable {
    
    /// How powerful the referenced flavor is for this berry
    open var potency: Int?
    
    /// The berry with the referenced flavor
    open var berry: PKMNamedAPIResource?
}

/// Berries are small fruits that can provide HP and status condition restoration, stat enhancement, and even damage negation when eaten by Pokémon. Check out Bulbapedia for greater detail.
open class PKMBerry: Codable{
    
    /// The identifier for this berry resource
    open var id: Int?
    
    /// The name for this berry resource
    open var name: String?
    
    /// Time it takes the tree to grow one stage, in hours. Berry trees go through four of these growth stages before they can be picked.
    open var growthTime: Int?
    
    /// The maximum number of these berries that can grow on one tree in Generation IV
    open var maxHarvest: Int?
    
    /// The power of the move "Natural Gift" when used with this Berry
    open var naturalGiftPower: Int?
    
    /// The size of this Berry, in millimeters
    open var size: Int?
    
    /// The smoothness of this Berry, used in making Pokéblocks or Poffins
    open var smoothness: Int?
    
    /// The speed at which this Berry dries out the soil as it grows. A higher rate means the soil dries more quickly.
    open var soilDryness: Int?
    
    /// The firmness of this berry, used in making Pokéblocks or Poffins
    open var firmness: PKMNamedAPIResource?
    
    /// A list of references to each flavor a berry can have and the potency of each of those flavors in regard to this berry
    open var flavors: [PKMBerryFlavorMap]?
    
    /// Berries are actually items. This is a reference to the item specific data for this berry.
    open var item: PKMNamedAPIResource?
    
    /// The Type the move "Natural Gift" has when used with this Berry
    open var naturalGiftType: PKMNamedAPIResource?
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

/// Berry Firmness
open class PKMBerryFirmness: Codable {
    
    /// The identifier for this berry firmness resource
    open var id: Int?
    
    /// The name of this berry firmness listed in different languages
    open var berries: [PKMNamedAPIResource]?
    
    /// A list of the berries with this firmness
    open var names: [PKMName]?
    
    /// The name for this berry firmness resource
    open var name: String?
}



// MARK: - Functions

/**
Fetch Berry list

- returns: A promise with PKMPagedObject
*/
public func fetchBerryList(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/berry"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Berry Information
 
 - parameter berryId: Berry ID
 */
public func fetchBerry(_ berryId: String, completion: @escaping (_ result: Result<PKMBerry>) -> Void) {
    let urlStr = baseURL + "/berry/" + berryId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Berry Firmness list
 */
public func fetchBerryFirmnessList(completion: @escaping (_ result: Result<PKMBerry>) -> Void) {
    let urlStr = baseURL + "/berry-firmness"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Berry Firmness Information
 
 - parameter berryFirmnessId: Berry Firmness ID
 */
public func fetchBerryFirmness(_ berryFirmnessId: String, completion: @escaping (_ result: Result<PKMBerryFirmness>) -> Void) {
    let urlStr = baseURL + "/berry-firmness/" + berryFirmnessId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Berry Flavors list
 */
public func fetchBerryFlavors(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/berry-flavor"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Berry Flavor Information
 
 - parameter berryFlavorId: Berry Flavor ID
 */
public func fetchBerryFlavour(_ berryFlavorId: String, completion: @escaping (_ result: Result<PKMBerryFlavor>) -> Void) {
    let urlStr = baseURL + "/berry-flavor/" + berryFlavorId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
Fetch Contest list
*/
public func fetchContestList(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void){
    let urlStr = baseURL + "/contest-type"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Contest Type Information
 
 - parameter contestTypeId: Contest Type ID
 */
public func fetchContestType(_ contestTypeId: String, completion: @escaping (_ result: Result<PKMContestType>) -> Void) {
    let urlStr = baseURL + "/contest-type/" + contestTypeId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Contest Effects list
 */
public func fetchContestEffects(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/contest-effect"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Contest Effect Information
 
 - parameter contestEffectId: Contest Effect ID
 */
public func fetchContestEffect(_ contestEffectId: String, completion: @escaping (_ result: Result<PKMContestEffect>) -> Void) {
    let urlStr = baseURL + "/contest-effect/" + contestEffectId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Super Contest Effects list
 */
public func fetchSuperContestEffects(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/contest-effect"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Super Contest Effect Information
 
 - parameter superContestEffectId: Super Contest Effect ID
 */
public func fetchSuperContestEffect(_ superContestEffectId: String, completion: @escaping (_ result: Result<PKMSuperContestEffect>) -> Void) {
    let urlStr = baseURL + "/super-contest-effect/" + superContestEffectId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Encounter Methods list
 */
public func fetchEncounterMethods(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/encounter-method"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Encounter Method Information
 
 - parameter encounterMethodId: Encounter Method ID
 */
public func fetchEncounterMethod(_ encounterMethodId: String, completion: @escaping (_ result: Result<PKMEncounterMethod>) -> Void) {
    let urlStr = baseURL + "/encounter-method/" + encounterMethodId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Encounter Conditions list
 */
public func fetchEncounterConditions(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/encounter-condition"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Encounter Condition Information
 
 - parameter encounterConditionId: Encounter Condition ID
 */
public func fetchEncounterCondition(_ encounterConditionId: String, completion: @escaping (_ result: Result<PKMEncounterCondition>) -> Void) {
    let urlStr = baseURL + "/encounter-condition/" + encounterConditionId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
Fetch Encounter Condition Values list
*/
public func fetchEncounterConditionValues(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/encounter-condition-value"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Encounter Condition Value Information
 
 - parameter encounterConditionValueId: Encounter Condition Value ID
 */
public func fetchEncounterConditionValue(_ encounterConditionValueId: String, completion: @escaping (_ result: Result<PKMEncounterConditionValue>) -> Void) {
    let urlStr = baseURL + "/encounter-condition-value/" + encounterConditionValueId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Encounter Chains list
 */
public func fetchEvolutionChains(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/evolution-chain"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Evolution Chain Information
 
 - parameter evolutionChainId: Evolution Chain ID
 */
public func fetchEvolutionChain(_ evolutionChainId: String, completion: @escaping (_ result: Result<PKMEvolutionChain>) -> Void) {
    let urlStr = baseURL + "/evolution-chain/" + evolutionChainId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Encounter Triggers list
 */
public func fetchEvolutionTriggers(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/evolution-trigger"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Evolution Trigger Information
 
 - parameter evolutionTriggerId: Evolution Trigger ID
 */
public func fetchEvolutionTrigger(_ evolutionTriggerId: String, completion: @escaping (_ result: Result<PKMEvolutionTrigger>) -> Void) {
    let urlStr = baseURL + "/evolution-trigger/" + evolutionTriggerId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Generations list
 */
public func fetchGenerations(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/generation"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Generation Information
 
 - parameter generationId: Generation ID
 */
public func fetchGeneration(_ generationId: String, completion: @escaping (_ result: Result<PKMGeneration>) -> Void) {
    let urlStr = baseURL + "/generation/" + generationId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Pokedexes list
 */
public func fetchPokedexes(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/pokedex"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Pokedex Information
 
 - parameter pokedexId: Pokedex ID
 */
public func fetchPokedex(_ pokedexId: String, completion: @escaping (_ result: Result<PKMPokedex>) -> Void) {
    let urlStr = baseURL + "/pokedex/" + pokedexId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Versions list
 */
public func fetchVersions(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/version"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Version Information
 
 - parameter versionId: Version ID
 */
public func fetchVersion(_ versionId: String, completion: @escaping (_ result: Result<PKMVersion>) -> Void) {
    let urlStr = baseURL + "/version/" + versionId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Versions Groups list
 */
public func fetchVersionGroups(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/version-group"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Version Group Information
 
 - parameter versionGroupId: Version Group ID
 */
public func fetchVersionGroup(_ versionGroupId: String, completion: @escaping (_ result: Result<PKMVersionGroup>) -> Void) {
    let urlStr = baseURL + "/version-group/" + versionGroupId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Items list
 */
public func fetchItems(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/item"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Item Information
 
 - parameter itemId: Item ID
 */
public func fetchItem(_ itemId: String, completion: @escaping (_ result: Result<PKMItem>) -> Void) {
    let urlStr = baseURL + "/item/" + itemId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Item Attributes list
 */
public func fetchItemAttributes(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/item-attribute"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Item Attribute Information
 
 - parameter itemAttributeId: Item Attribute ID
 */
public func fetchItemAttribute(_ itemAttributeId: String, completion: @escaping (_ result: Result<PKMItemAttribute>) -> Void) {
    let urlStr = baseURL + "/item-attribute/" + itemAttributeId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Item Categories list
 */
public func fetchItemCategories(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/item-category"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Item Category Information
 
 - parameter itemCategoryId: Item Category ID
 */
public func fetchItemCategory(_ itemCategoryId: String, completion: @escaping (_ result: Result<PKMItemCategory>) -> Void) {
    let urlStr = baseURL + "/item-category/" + itemCategoryId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Item Fling Effects list
 */
public func fetchItemFlingEffects(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/item-fling-effect"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Item Fling Effect Information
 
 - parameter itemFlingEffectsId: Item Fling Effect ID
 */
public func fetchItemFlingEffect(_ itemFlingEffectsId: String, completion: @escaping (_ result: Result<PKMItemFlingEffect>) -> Void) {
    let urlStr = baseURL + "/item-fling-effect/" + itemFlingEffectsId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Item Pockets list
 */
public func fetchItemPockets(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/item-pocket"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Item Pocket Information
 
 - parameter itemPocketId: Item Pocket ID
 */
public func fetchItemPocket(_ itemPocketId: String, completion: @escaping (_ result: Result<PKMItemPocket>) -> Void) {
    let urlStr = baseURL + "/item-pocket/" + itemPocketId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Moves list
 */
public func fetchMoves(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/move"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Move Information
 
 - parameter moveId: Move ID
 */
public func fetchMove(_ moveId: String, completion: @escaping (_ result: Result<PKMMove>) -> Void) {
    let urlStr = baseURL + "/move/" + moveId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Moves Ailments list
 */
public func fetchMoveAilments(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/move-ailment"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Move Ailment Information
 
 - parameter moveAilmentId: Move Ailment ID
 */
public func fetchMoveAilment(_ moveAilmentId: String, completion: @escaping (_ result: Result<PKMMoveAilment>) -> Void) {
    let urlStr = baseURL + "/move-ailment/" + moveAilmentId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Moves Battle Styles list
 */
public func fetchMoveBattleStyles(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/move-battle-style"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Move Battle Style Information
 
 - parameter moveBattleStyleId: Move Battle Style ID
 */
public func fetchMoveBattleStyle(_ moveBattleStyleId: String, completion: @escaping (_ result: Result<PKMMoveBattleStyle>) -> Void) {
    let urlStr = baseURL + "/move-battle-style/" + moveBattleStyleId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Moves Categories list
 */
public func fetchMoveCategories(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/move-category"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Move Category Information
 
 - parameter moveCategoryId: Move Category ID
 */
public func fetchMoveCategory(_ moveCategoryId: String, completion: @escaping (_ result: Result<PKMMoveCategory>) -> Void) {
    let urlStr = baseURL + "/move-category/" + moveCategoryId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Moves Damage Classes list
 */
public func fetchMoveDamageClasses(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/move-damage-class"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Move Damage Class Information
 
 - parameter moveDamageClassId: Move Damage Class ID
 */
public func fetchMoveDamageClass(_ moveDamageClassId: String, completion: @escaping (_ result: Result<PKMMoveDamageClass>) -> Void) {
    let urlStr = baseURL + "/move-damage-class/" + moveDamageClassId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Moves Learn Methods list
 */
public func fetchMoveLearnMethods(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/move-learn-method"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Move Learn Method Information
 
 - parameter moveLearnMethodId: Move Learn Method ID
 */
public func fetchMoveLearnMethod(_ moveLearnMethodId: String, completion: @escaping (_ result: Result<PKMMoveLearnMethod>) -> Void) {
    let urlStr = baseURL + "/move-learn-method/" + moveLearnMethodId
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Moves Targets list
 */
public func fetchMoveTargets(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/move-target"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Move Target Information
 
 - parameter moveTargetId: Move Target ID
 */
public func fetchMoveTarget(_ moveTargetId: String, completion: @escaping (_ result: Result<PKMMoveTarget>) -> Void) {
    let urlStr = baseURL + "/move-target/" + moveTargetId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Locations list
 */
public func fetchLocations(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/location"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Location Information
 
 - parameter locationId: Location ID
 */
public func fetchLocation(_ locationId: String, completion: @escaping (_ result: Result<PKMMoveTarget>) -> Void) {
    let urlStr = baseURL + "/location/" + locationId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Location Area list
 */
public func fetchLocationAreas(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/location-area"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Location Area Information
 
 - parameter locationAreaId: Location Area ID
 */
public func fetchLocationArea(_ locationAreaId: String, completion: @escaping (_ result: Result<PKMLocationArea>) -> Void) {
    let urlStr = baseURL + "/location-area/" + locationAreaId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Pal Park Areas list
 */
public func fetchPalParkAreas(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/pal-park-area"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Pal Park Area Information
 
 - parameter palParkAreaId: Pal Park Area ID
 */
public func fetchPalParkArea(_ palParkAreaId: String, completion: @escaping (_ result: Result<PKMPalParkArea>) -> Void) {
    let urlStr = baseURL + "/pal-park-area/" + palParkAreaId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Regions list
 */
public func fetchRegions(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/region"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Region Information
 
 - parameter regionId: Region ID
 */
public func fetchRegion(_ regionId: String, completion: @escaping (_ result: Result<PKMRegion>) -> Void) {
    let urlStr = baseURL + "/region/" + regionId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Abilities list
 */
public func fetchAbilities(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/ability"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Ability Information
 
 - parameter abilityId: Ability ID
 */
public func fetchAbility(_ abilityId: String, completion: @escaping (_ result: Result<PKMAbility>) -> Void) {
    let urlStr = baseURL + "/ability/" + abilityId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Characteristics list
 */
public func fetchCharacteristics(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/characteristic"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Characteristic Information
 
 - parameter characteristicId: Characteristic ID
 */
public func fetchCharacteristic(_ characteristicId: String, completion: @escaping (_ result: Result<PKMCharacteristic>) -> Void) {
    let urlStr = baseURL + "/characteristic/" + characteristicId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Egg Group list
 */
public func fetchEggGroup(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/egg-group"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Egg Group Information
 
 - parameter eggGroupId: Egg Group ID
 */
public func fetchEggGroup(_ eggGroupId: String, completion: @escaping (_ result: Result<PKMEggGroup>) -> Void) {
    let urlStr = baseURL + "/egg-group/" + eggGroupId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Genders list
 */
public func fetchGenders(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/gender"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Gender Information
 
 - parameter genderId: Gender ID
 */
public func fetchGender(_ genderId: String, completion: @escaping (_ result: Result<PKMGender>) -> Void) {
    let urlStr = baseURL + "/gender/" + genderId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Growth Rate list
 */
public func fetchGrowthRates(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/growth-rate"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Growth Rate Information
 
 - parameter growthRateId: Growth Rate ID
 */
public func fetchGrowthRate(_ growthRateId: String, completion: @escaping (_ result: Result<PKMGrowthRate>) -> Void) {
    let urlStr = baseURL + "/growth-rate/" + growthRateId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Nature list
 */
public func fetchNatures(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/nature"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}

/**
 Fetch Nature Information
 
 - parameter natureId: Nature ID
 */
public func fetchNature(_ natureId: String, completion: @escaping (_ result: Result<PKMNature>) -> Void) {
    let urlStr = baseURL + "/nature/" + natureId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Pokeathlon Stat list
 */
public func fetchPokeathlonStats(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/pokeathlon-stat"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Pokeathlon Stat Information
 
 - parameter pokeathlonStatId: Pokeathlon Stat ID
 */
public func fetchPokeathlonStat(_ pokeathlonStatId: String, completion: @escaping (_ result: Result<PKMPokeathlonStat>) -> Void) {
    let urlStr = baseURL + "/pokeathlon-stat/" + pokeathlonStatId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Pokemon list
 */
public func fetchPokemons(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/pokemon"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Pokemon Information
 
 - parameter pokemonId: Pokemon ID
 */
public func fetchPokemon(_ pokemonId: String, completion: @escaping (_ result: Result<PKMPokemon>) -> Void) {
    let urlStr = baseURL + "/pokemon/" + pokemonId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Pokemon Color list
 */
public func fetchPokemonColors(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/pokemon-color"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Pokemon Color Information
 
 - parameter pokemonColorId: Pokemon Color ID
 */
public func fetchPokemonColor(_ pokemonColorId: String, completion: @escaping (_ result: Result<PKMPokemonColor>) -> Void) {
    let urlStr = baseURL + "/pokemon-color/" + pokemonColorId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Pokemon Form list
 */
public func fetchPokemonForms(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/pokemon-form"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Pokemon Form Information
 
 - parameter pokemonFormId: Pokemon Form ID
 */
public func fetchPokemonForm(_ pokemonFormId: String, completion: @escaping (_ result: Result<PKMPokemonForm>) -> Void) {
    let urlStr = baseURL + "/pokemon-form/" + pokemonFormId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Pokemon Habitat list
 */
public func fetchPokemonHabitats(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/pokemon-habitat"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Pokemon Habitat Information
 
 - parameter pokemonHabitatId: Pokemon Habitat ID
 */
public func fetchPokemonHabitat(_ pokemonHabitatId: String, completion: @escaping (_ result: Result<PKMPokemonHabitat>) -> Void) {
    let urlStr = baseURL + "/pokemon-habitat/" + pokemonHabitatId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Pokemon Shape list
 */
public func fetchPokemonShapes(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/pokemon-shape"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Pokemon Shape Information
 
 - parameter pokemonShapeId: Pokemon Shape ID
 */
public func fetchPokemonShape(_ pokemonShapeId: String, completion: @escaping (_ result: Result<PKMPokemonShape>) -> Void) {
    let urlStr = baseURL + "/pokemon-shape/" + pokemonShapeId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Pokemon Species list
 */
public func fetchPokemonSpecies(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/pokemon-species"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Pokemon Species Information
 
 - parameter pokemonSpeciesId: Pokemon Species ID
 */
public func fetchPokemonSpecies(_ pokemonSpeciesId: String, completion: @escaping (_ result: Result<PKMPokemonSpecies>) -> Void) {
    let urlStr = baseURL + "/pokemon-species/" + pokemonSpeciesId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Stat list
 */
public func fetchStats(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/stat"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Stat Information
 
 - parameter statId: Stat ID
 */
public func fetchStat(_ statId: String, completion: @escaping (_ result: Result<PKMStat>) -> Void) {
    let urlStr = baseURL + "/stat/" + statId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Type list
 */
public func fetchType(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/type"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Type Information
 
 - parameter typeId: Type ID
 */
public func fetchType(_ typeId: String, completion: @escaping (_ result: Result<PKMType>) -> Void) {
    let urlStr = baseURL + "/type/" + typeId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Languages list
 */
public func fetchLanguages(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
    let urlStr = baseURL + "/language"
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}


/**
 Fetch Language Information
 
 - parameter languageId: Language ID
 */
public func fetchLanguage(_ languageId: String, completion: @escaping (_ result: Result<PKMLanguage>) -> Void) {
    let urlStr = baseURL + "/language/" + languageId
    
    HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
        result.decode(completion: completion)
    }
}
