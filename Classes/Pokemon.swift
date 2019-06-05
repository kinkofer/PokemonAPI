//
//  Pokemon.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/27/18.
//

import Foundation


// MARK: - Abilities

/// Abilities provide passive effects for Pokémon in battle or in the overworld. Pokémon have mutiple possible abilities but can have only one ability at a time. Check out Bulbapedia for greater detail.
open class PKMAbility: Codable, SelfDecodable {
    
    /// The identifier for this ability resource
    open var id: Int?
    
    /// The name for this ability resource
    open var name: String?
    
    /// Whether or not this ability originated in the main series of the video games
    open var isMainSeries: Bool?
    
    /// The generation this ability originated in
    open var generation: PKMNamedAPIResource<PKMGeneration>?
    
    /// The name of this ability listed in different languages
    open var names: [PKMName]?
    
    /// The effect of this ability listed in different languages
    open var effectEntries: [PKMVerboseEffect]?
    
    /// The list of previous effects this ability has had across version groups
    open var effectChanges: [PKMAbilityEffectChange]?
    
    /// The flavor text of this ability listed in different languages
    open var flavorTextEntries: [PKMAbilityFlavorText]?
    
    /// A list of Pokémon that could potentially have this ability
    open var pokemon: [PKMAbilityPokemon]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Ability Effect Change
open class PKMAbilityEffectChange: Codable, SelfDecodable {
    
    /// The previous effect of this ability listed in different languages
    open var effectEntries: [PKMEffect]?
    
    /// The version group in which the previous effect of this ability originated
    open var versionGroup: PKMNamedAPIResource<PKMVersion>?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Ability Flavor Text
open class PKMAbilityFlavorText: Codable, SelfDecodable {
    
    /// The localized name for an API resource in a specific language
    open var flavorText: String?
    
    /// The language this name is in
    open var language: PKMNamedAPIResource<PKMLanguage>?
    
    /// The language this name is in
    open var versionGroup: PKMNamedAPIResource<PKMVersion>?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Ability Pokemon
open class PKMAbilityPokemon: Codable, SelfDecodable {
    
    /// Whether or not this a hidden ability for the referenced Pokémon
    open var isHidden: Bool?
    
    /// Pokémon have 3 ability 'slots' which hold references to possible abilities they could have. This is the slot of this ability for the referenced pokemon.
    open var slot: Int?
    
    /// The Pokémon this ability could belong to
    open var pokemon: PKMNamedAPIResource<PKMPokemon>?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Characteristics

/// Characteristics indicate which stat contains a Pokémon's highest IV. A Pokémon's Characteristic is determined by the remainder of its highest IV divided by 5 (gene_modulo). Check out Bulbapedia for greater detail.
open class PKMCharacteristic: Codable, SelfDecodable {
    
    /// The identifier for this characteristic resource
    open var id: Int?
    
    /// The remainder of the highest stat/IV divided by 5
    open var geneModulo: Int?
    
    /// The possible values of the highest stat that would result in a Pokémon recieving this characteristic when divided by 5
    open var possibleValues: [Int]?
    
    /// The descriptions of this characteristic listed in different languages
    open var descriptions: [PKMDescription]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Egg Groups

/// Egg Groups are categories which determine which Pokémon are able to interbreed. Pokémon may belong to either one or two Egg Groups. Check out Bulbapedia for greater detail.
open class PKMEggGroup: Codable, SelfDecodable {
    
    /// The identifier for this egg group resource
    open var id: Int?
    
    /// The name for this egg group resource
    open var name: String?
    
    /// The name of this egg group listed in different languages
    open var names: [PKMName]?
    
    /// A list of all Pokémon species that are members of this egg group
    open var pokemonSpecies: [PKMNamedAPIResource<PKMPokemonSpecies>]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Genders

/// Genders were introduced in Generation II for the purposes of breeding Pokémon but can also result in visual differences or even different evolutionary lines. Check out Bulbapedia for greater detail.
open class PKMGender: Codable, SelfDecodable {
    
    /// The identifier for this gender resource
    open var id: Int?
    
    /// The name for this gender resource
    open var name: String?
    
    /// A list of Pokémon species that can be this gender and how likely it is that they will be
    open var pokemonSpeciesDetails: [PKMPokemonSpeciesGender]?
    
    /// A list of Pokémon species that required this gender in order for a Pokémon to evolve into them
    open var requiredForEvolution: [PKMNamedAPIResource<PKMPokemonSpecies>]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Species Gender
open class PKMPokemonSpeciesGender: Codable, SelfDecodable {
    
    /// The chance of this Pokémon being female, in eighths; or -1 for genderless
    open var rate: Int?
    
    /// A Pokémon species that can be the referenced gender
    open var pokemonSpecies: PKMNamedAPIResource<PKMPokemonSpecies>?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Growth Rates

/// Growth rates are the speed with which Pokémon gain levels through experience. Check out Bulbapedia ( http://bulbapedia.bulbagarden.net/wiki/Experience ) for greater detail.
open class PKMGrowthRate: Codable, SelfDecodable {
    
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
    open var pokemonSpecies: [PKMNamedAPIResource<PKMPokemonSpecies>]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Growth Rate Experience Level
open class PKMGrowthRateExperienceLevel: Codable {
    
    /// The level gained
    open var level: Int?
    
    /// The amount of experience required to reach the referenced level
    open var experience: Int?
}



// MARK: - Natures

/// Natures influence how a Pokémon's stats grow. See Bulbapedia ( http://bulbapedia.bulbagarden.net/wiki/Nature ) for greater detail.
open class PKMNature: Codable, SelfDecodable {
    
    /// The identifier for this nature resource
    open var id: Int?
    
    /// The name for this nature resource
    open var name: String?
    
    /// The stat decreased by 10% in Pokémon with this nature
    open var decreasedStat: PKMNamedAPIResource<PKMStat>?
    
    /// The stat increased by 10% in Pokémon with this nature
    open var increasedStat: PKMNamedAPIResource<PKMStat>?
    
    /// The flavor hated by Pokémon with this nature
    open var hatesFlavor: PKMNamedAPIResource<PKMBerryFlavor>?
    
    /// he flavor liked by Pokémon with this nature
    open var likesFlavor: PKMNamedAPIResource<PKMBerryFlavor>?
    
    /// A list of Pokéathlon stats this nature effects and how much it effects them
    open var pokeathlonStatChanges: [PKMNatureStatChange]?
    
    /// A list of battle styles and how likely a Pokémon with this nature is to use them in the Battle Palace or Battle Tent.
    open var moveBattleStylePreferences: [PKMMoveBattleStylePreference]?
    
    /// The name of this nature listed in different languages
    open var names: [PKMName]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Nature Stat Change
open class PKMNatureStatChange: Codable, SelfDecodable {
    
    /// The amount of change
    open var maxChange: Int?
    
    /// The stat being affected
    open var pokeathlonStat: PKMNamedAPIResource<PKMPokeathlonStat>?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Move Battle Style Preference
open class PKMMoveBattleStylePreference: Codable, SelfDecodable {
    
    /// Chance of using the move, in percent, if HP is under one half
    open var lowHpPreference: Int?
    
    /// Chance of using the move, in percent, if HP is over one half
    open var highHpPreference: Int?
    
    /// The move battle style
    open var moveBattleStyle: PKMNamedAPIResource<PKMMoveBattleStyle>?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Pokeathlon Stats

/// Pokeathlon Stats are different attributes of a Pokémon's performance in Pokéathlons. In Pokéathlons, competitions happen on different courses; one for each of the different Pokéathlon stats. See Bulbapedia for greater detail.
open class PKMPokeathlonStat: Codable, SelfDecodable {
    
    /// The identifier for this Pokéathlon stat resource
    open var id: Int?
    
    /// The name for this Pokéathlon stat resource
    open var name: String?
    
    /// The name of this Pokéathlon stat listed in different languages
    open var names: [PKMName]?
    
    /// A detail of natures which affect this Pokéathlon stat positively or negatively
    open var affectingNatures: PKMNaturePokeathlonStatAffectSets?
    
    public static var decoder: JSONDecoder = {
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


/// Nature Pokeathlon Stat Affect
open class PKMNaturePokeathlonStatAffect: Codable, SelfDecodable {
    
    /// The maximum amount of change to the referenced Pokéathlon stat
    open var maxChange: Int?
    
    /// The nature causing the change
    open var nature: PKMNamedAPIResource<PKMNature>?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Pokemon

/// Pokémon are the creatures that inhabit the world of the Pokémon games. They can be caught using Pokéballs and trained by battling with other Pokémon. See Bulbapedia for greater detail.
open class PKMPokemon: Codable, SelfDecodable {
    
    /// The identifier for this Pokémon resource
    open var id: Int?
    
    /// The name for this Pokémon resource
    open var name: String?
    
    /// The base experience gained for defeating this Pokémon
    open var baseExperience: Int?
    
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
    open var forms: [PKMNamedAPIResource<PKMPokemonForm>]?
    
    /// A list of game indices relevent to Pokémon item by generation
    open var gameIndices: [PKMVersionGameIndex]?
    
    /// A list of items this Pokémon may be holding when encountered
    open var heldItems: [PKMPokemonHeldItem]?
    
    /// A list of location areas as well as encounter details pertaining to specific versions
    open var locationAreaEncounters: String?
    
    /// A list of moves along with learn methods and level details pertaining to specific version groups
    open var moves: [PKMPokemonMove]?
    
    /// A set of sprites used to depict this Pokémon in the game
    open var sprites: PKMPokemonSprites?
    
    /// The species this Pokémon belongs to
    open var species: PKMNamedAPIResource<PKMPokemonSpecies>?
    
    /// A list of base stat values for this Pokémon
    open var stats: [PKMPokemonStat]?
    
    /// A list of details showing types this Pokémon has
    open var types: [PKMPokemonType]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Ability
open class PKMPokemonAbility: Codable, SelfDecodable {
    
    /// Whether or not this is a hidden ability
    open var isHidden: Bool?
    
    /// The slot this ability occupies in this Pokémon species
    open var slot: Int?
    
    /// The ability the Pokémon may have
    open var ability: PKMNamedAPIResource<PKMAbility>?
    
    public static var decoder: JSONDecoder = {
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
    open var type: PKMNamedAPIResource<PKMType>?
}


/// Pokemon Held Item
open class PKMPokemonHeldItem: Codable, SelfDecodable {
    
    /// The item the referenced Pokémon holds
    open var item: PKMNamedAPIResource<PKMItem>?
    
    /// The details of the different versions in which the item is held
    open var versionDetails: [PKMPokemonHeldItemVersion]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Held Item Version
open class PKMPokemonHeldItemVersion: Codable {
    
    /// The version in which the item is held
    open var version: PKMNamedAPIResource<PKMVersion>?
    
    /// How often the item is held
    open var rarity: Int?
}


/// Pokemon Move
open class PKMPokemonMove: Codable, SelfDecodable {
    
    /// The move the Pokémon can learn
    open var move: PKMNamedAPIResource<PKMMove>?
    
    /// The details of the version in which the Pokémon can learn the move
    open var versionGroupDetails: [PKMPokemonMoveVersion]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Move Version
open class PKMPokemonMoveVersion: Codable, SelfDecodable {
    
    /// The method by which the move is learned
    open var moveLearnMethod: PKMNamedAPIResource<PKMMoveLearnMethod>?
    
    /// The version group in which the move is learned
    open var versionGroup: PKMNamedAPIResource<PKMVersion>?
    
    /// The version group in which the move is learned
    open var levelLearnedAt: Int?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Stat
open class PKMPokemonStat: Codable, SelfDecodable {
    
    /// The stat the Pokémon has
    open var stat: PKMNamedAPIResource<PKMStat>?
    
    /// The effort points (EV) the Pokémon has in the stat
    open var effort: Int?
    
    /// The base value of the stat
    open var baseStat: Int?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Sprites
open class PKMPokemonSprites: Codable, SelfDecodable {
    
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
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Location Area Encounter
open class PKMLocationAreaEncounter: Codable, SelfDecodable {
    
    /// The location area the referenced Pokémon can be encountered in
    open var locationArea: PKMNamedAPIResource<PKMLocationArea>?
    
    /// A list of versions and encounters with the referenced Pokémon that might happen
    open var versionDetails: [PKMVersionEncounterDetail]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Pokemon Colors

/// Colors used for sorting Pokémon in a Pokédex. The color listed in the Pokédex is usually the color most apparent or covering each Pokémon's body. No orange category exists; Pokémon that are primarily orange are listed as red or brown.
open class PKMPokemonColor: Codable, SelfDecodable {
    
    /// The identifier for this Pokémon color resource
    open var id: Int?
    
    /// The name for this Pokémon color resource
    open var name: String?
    
    /// The name of this Pokémon color listed in different languages
    open var names: [PKMName]?
    
    /// A list of the Pokémon species that have this color
    open var pokemonSpecies: [PKMNamedAPIResource<PKMPokemonSpecies>]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Pokemon Forms

/// Some Pokémon have the ability to take on different forms. At times, these differences are purely cosmetic and have no bearing on the difference in the Pokémon's stats from another; however, several Pokémon differ in stats (other than HP), type, and Ability depending on their form.
open class PKMPokemonForm: Codable, SelfDecodable {
    
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
    open var pokemon: PKMNamedAPIResource<PKMPokemon>?
    
    /// A set of sprites used to depict this Pokémon form in the game
    open var sprites: PKMPokemonFormSprites?
    
    /// The version group this Pokémon form was introduced in
    open var versionGroup: PKMNamedAPIResource<PKMVersionGroup>?
    
    /// The form specific full name of this Pokémon form, or empty if the form does not have a specific name
    open var names: [PKMName]?
    
    /// The form specific form name of this Pokémon form, or empty if the form does not have a specific name
    open var formNames: [PKMName]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Form Sprites
open class PKMPokemonFormSprites: Codable, SelfDecodable {
    
    /// The default depiction of this Pokémon form from the front in battle
    open var frontDefault: String?
    
    /// The shiny depiction of this Pokémon form from the front in battle
    open var frontShiny: String?
    
    /// The default depiction of this Pokémon form from the back in battle
    open var backDefault: String?
    
    /// The shiny depiction of this Pokémon form from the back in battle
    open var backShiny: String?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Pokemon Habitats

/// Habitats are generally different terrain Pokémon can be found in but can also be areas designated for rare or legendary Pokémon.
open class PKMPokemonHabitat: Codable, SelfDecodable {
    
    /// The identifier for this Pokémon habitat resource
    open var id: Int?
    
    /// The name for this Pokémon habitat resource
    open var name: String?
    
    /// The name of this Pokémon habitat listed in different languages
    open var names: [PKMName]?
    
    /// A list of the Pokémon species that can be found in this habitat
    open var pokemonSpecies: [PKMNamedAPIResource<PKMPokemonSpecies>]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Pokemon Shapes

/// Shapes used for sorting Pokémon in a Pokédex.
open class PKMPokemonShape: Codable, SelfDecodable {
    
    /// The identifier for this Pokémon shape
    open var id: Int?
    
    /// The name for this Pokémon shape resource
    open var name: String?
    
    /// The "scientific" name of this Pokémon shape listed in different languages
    open var awesomeNames: [PKMAwesomeName]?
    
    /// The name of this Pokémon shape listed in different languages
    open var names: [PKMName]?
    
    /// A list of the Pokémon species that have this shape
    open var pokemonSpecies: [PKMNamedAPIResource<PKMPokemonSpecies>]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// An Awesome Name
open class PKMAwesomeName: Codable, SelfDecodable {
    
    /// The localized "scientific" name for an API resource in a specific language
    open var awesomeName: String?
    
    /// The language this "scientific" name is in
    open var language: PKMNamedAPIResource<PKMLanguage>?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Pokemon Species

/// A Pokémon Species forms the basis for at least one Pokémon. Attributes of a Pokémon species are shared across all varieties of Pokémon within the species. A good example is Wormadam; Wormadam is the species which can be found in three different varieties, Wormadam-Trash, Wormadam-Sandy and Wormadam-Plant.
open class PKMPokemonSpecies: Codable, SelfDecodable {
    
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
    open var growthRate: PKMNamedAPIResource<PKMGrowthRate>?
    
    /// A list of pokedexes and the indexes reserved within them for this Pokémon species
    open var pokedexNumbers: [PKMPokemonSpeciesDexEntry]?
    
    /// A list of egg groups this Pokémon species is a member of
    open var eggGroups: [PKMNamedAPIResource<PKMEggGroup>]?
    
    /// The color of this Pokémon for gimmicky Pokédex search
    open var color: PKMNamedAPIResource<PKMPokemonColor>?
    
    /// The shape of this Pokémon for gimmicky Pokédex search
    open var shape: PKMNamedAPIResource<PKMPokemonShape>?
    
    /// The Pokémon species that evolves into this pokemon_species
    open var evolvesFromSpecies: PKMNamedAPIResource<PKMPokemonSpecies>?
    
    /// The evolution chain this Pokémon species is a member of
    open var evolutionChain: PKMAPIResource<PKMEvolutionChain>?
    
    /// The habitat this Pokémon species can be encountered in
    open var habitat: PKMNamedAPIResource<PKMPokemonHabitat>?
    
    /// The generation this Pokémon species was introduced in
    open var generation: PKMNamedAPIResource<PKMGeneration>?
    
    /// The name of this Pokémon species listed in different languages
    open var names: [PKMName]?
    
    /// A list of encounters that can be had with this Pokémon species in pal park
    open var palParkEncounters: [PKMPalParkEncounterArea]?
    
    /// The flavor text of this flavor text listed in different languages
    open var flavorTextEntries: [PKMFlavorText]?
    
    /// Descriptions of different forms Pokémon take on within the Pokémon species
    open var formDescriptions: [PKMDescription]?
    
    /// The genus of this Pokémon species listed in multiple languages
    open var genera: [PKMGenus]?
    
    /// A list of the Pokémon that exist within this Pokémon species
    open var varieties: [PKMPokemonSpeciesVariety]?
    
    public static var decoder: JSONDecoder = {
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
    open var language: PKMNamedAPIResource<PKMLanguage>?
}


/// Pokemon Species Dex Entry
open class PKMPokemonSpeciesDexEntry: Codable, SelfDecodable {
    
    /// The index number within the Pokédex
    open var entryNumber: Int?
    
    /// The Pokédex the referenced Pokémon species can be found in
    open var name: PKMNamedAPIResource<PKMName>?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// PalPark Encounter Area
open class PKMPalParkEncounterArea: Codable, SelfDecodable {
    
    /// The base score given to the player when the referenced Pokémon is caught during a pal park run
    open var baseScore: Int?
    
    /// The base rate for encountering the referenced Pokémon in this pal park area
    open var rate: Int?
    
    /// The pal park area where this encounter happens
    open var area: PKMNamedAPIResource<PKMPalParkArea>?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Species Variety
open class PKMPokemonSpeciesVariety: Codable, SelfDecodable {
    
    // Whether this variety is the default variety
    open var isDefault: Bool?
    
    // The Pokémon variety
    open var pokemon: PKMNamedAPIResource<PKMPokemon>?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Stats

/// Stats determine certain aspects of battles. Each Pokémon has a value for each stat which grows as they gain levels and can be altered momentarily by effects in battles.
open class PKMStat: Codable, SelfDecodable {
    
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
    open var characteristics: [PKMAPIResource<PKMCharacteristic>]?
    
    /// The class of damage this stat is directly related to
    open var moveDamageClass: PKMNamedAPIResource<PKMMoveDamageClass>?
    
    /// The name of this region listed in different languages
    open var names: [PKMName]?
    
    public static var decoder: JSONDecoder = {
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


/// Move Stat Affect
open class PKMMoveStatAffect: Codable, SelfDecodable {
    
    /// The maximum amount of change to the referenced stat
    open var change: Int?
    
    /// The move causing the change
    open var move: PKMNamedAPIResource<PKMMove>?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Nature Affect Set
open class PKMNatureStatAffectSets: Codable {
    
    /// A list of natures and how they change the referenced stat
    open var increase: [PKMNamedAPIResource<PKMNature>]?
    
    /// A list of nature sand how they change the referenced stat
    open var decrease: [PKMNamedAPIResource<PKMNature>]?
}



// MARK: - Types

/// Types are properties for Pokémon and their moves. Each type has three properties: which types of Pokémon it is super effective against, which types of Pokémon it is not very effective against, and which types of Pokémon it is completely ineffective against.
open class PKMType: Codable, SelfDecodable {
    
    /// The identifier for this type resource
    open var id: Int?
    
    /// The name for this type resource
    open var name: String?
    
    /// A detail of how effective this type is toward others and vice versa
    open var damageRelations: PKMTypeRelations?
    
    /// A list of game indices relevent to this item by generation
    open var gameIndices: [PKMGenerationGameIndex]?
    
    /// The generation this type was introduced in
    open var generation: PKMNamedAPIResource<PKMGeneration>?
    
    /// The class of damage inflicted by this type
    open var moveDamageClass: PKMNamedAPIResource<PKMMoveDamageClass>?
    
    /// The name of this type listed in different languages
    open var names: [PKMName]?
    
    /// A list of details of Pokémon that have this type
    open var pokemon: [PKMTypePokemon]?
    
    /// A list of moves that have this type
    open var moves: [PKMNamedAPIResource<PKMMove>]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Type
open class PKMTypePokemon: Codable {
    
    /// The order the Pokémon's types are listed in
    open var slot: Int?
    
    /// The Pokémon that has the referenced type
    open var pokemon: PKMNamedAPIResource<PKMPokemon>?
}


/// Pokemon Type Relations
open class PKMTypeRelations: Codable, SelfDecodable {
    
    /// A list of types this type has no effect on
    open var noDamageTo: [PKMNamedAPIResource<PKMType>]?
    
    /// A list of types this type is not very effect against
    open var halfDamageTo: [PKMNamedAPIResource<PKMType>]?
    
    /// A list of types this type is very effect against
    open var doubleDamageTo: [PKMNamedAPIResource<PKMType>]?
    
    /// A list of types that have no effect on this type
    open var noDamageFrom: [PKMNamedAPIResource<PKMType>]?
    
    /// A list of types that are not very effective against this type
    open var halfDamageFrom: [PKMNamedAPIResource<PKMType>]?
    
    /// A list of types that are very effective against this type
    open var doubleDamageFrom: [PKMNamedAPIResource<PKMType>]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Web Services

open class PokemonService {
    /**
     Fetch Abilities list
     */
    public static func fetchAbilityList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMAbility {
        let urlStr = baseURL + "/ability"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Ability Information
     
     - parameter abilityId: Ability ID
     */
    public static func fetchAbility(_ abilityId: Int, completion: @escaping (_ result: Result<PKMAbility, HTTPError>) -> Void) {
        let urlStr = baseURL + "/ability/\(abilityId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Ability Information
     
     - parameter abilityName: Ability Name
     */
    public static func fetchAbility(_ abilityName: String, completion: @escaping (_ result: Result<PKMAbility, HTTPError>) -> Void) {
        let urlStr = baseURL + "/ability/\(abilityName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Characteristics list
     */
    public static func fetchCharacteristicList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMCharacteristic {
        let urlStr = baseURL + "/characteristic"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Characteristic Information
     
     - parameter characteristicId: Characteristic ID
     */
    public static func fetchCharacteristic(_ characteristicId: Int, completion: @escaping (_ result: Result<PKMCharacteristic, HTTPError>) -> Void) {
        let urlStr = baseURL + "/characteristic/\(characteristicId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Egg Group list
     */
    public static func fetchEggGroupList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMEggGroup {
        let urlStr = baseURL + "/egg-group"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Egg Group Information
     
     - parameter eggGroupId: Egg Group ID
     */
    public static func fetchEggGroup(_ eggGroupId: Int, completion: @escaping (_ result: Result<PKMEggGroup, HTTPError>) -> Void) {
        let urlStr = baseURL + "/egg-group/\(eggGroupId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Egg Group Information
     
     - parameter eggGroupName: Egg Group Name
     */
    public static func fetchEggGroup(_ eggGroupName: String, completion: @escaping (_ result: Result<PKMEggGroup, HTTPError>) -> Void) {
        let urlStr = baseURL + "/egg-group/\(eggGroupName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Genders list
     */
    public static func fetchGenderList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMGender {
        let urlStr = baseURL + "/gender"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Gender Information
     
     - parameter genderId: Gender ID
     */
    public static func fetchGender(_ genderId: Int, completion: @escaping (_ result: Result<PKMGender, HTTPError>) -> Void) {
        let urlStr = baseURL + "/gender/\(genderId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Gender Information
     
     - parameter genderName: Gender Name
     */
    public static func fetchGender(_ genderName: String, completion: @escaping (_ result: Result<PKMGender, HTTPError>) -> Void) {
        let urlStr = baseURL + "/gender/\(genderName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Growth Rate list
     */
    public static func fetchGrowthRateList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMGrowthRate {
        let urlStr = baseURL + "/growth-rate"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Growth Rate Information
     
     - parameter growthRateId: Growth Rate ID
     */
    public static func fetchGrowthRate(_ growthRateId: Int, completion: @escaping (_ result: Result<PKMGrowthRate, HTTPError>) -> Void) {
        let urlStr = baseURL + "/growth-rate/\(growthRateId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Growth Rate Information
     
     - parameter growthRateName: Growth Rate Name
     */
    public static func fetchGrowthRate(_ growthRateName: String, completion: @escaping (_ result: Result<PKMGrowthRate, HTTPError>) -> Void) {
        let urlStr = baseURL + "/growth-rate/\(growthRateName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Nature list
     */
    public static func fetchNatureList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMNature {
        let urlStr = baseURL + "/nature"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    /**
     Fetch Nature Information
     
     - parameter natureId: Nature ID
     */
    public static func fetchNature(_ natureId: Int, completion: @escaping (_ result: Result<PKMNature, HTTPError>) -> Void) {
        let urlStr = baseURL + "/nature/\(natureId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Nature Information
     
     - parameter natureName: Nature Name
     */
    public static func fetchNature(_ natureName: String, completion: @escaping (_ result: Result<PKMNature, HTTPError>) -> Void) {
        let urlStr = baseURL + "/nature/\(natureName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokeathlon Stat list
     */
    public static func fetchPokeathlonStatList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMPokeathlonStat {
        let urlStr = baseURL + "/pokeathlon-stat"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Pokeathlon Stat Information
     
     - parameter pokeathlonStatId: Pokeathlon Stat ID
     */
    public static func fetchPokeathlonStat(_ pokeathlonStatId: Int, completion: @escaping (_ result: Result<PKMPokeathlonStat, HTTPError>) -> Void) {
        let urlStr = baseURL + "/pokeathlon-stat/\(pokeathlonStatId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokeathlon Stat Information
     
     - parameter pokeathlonStatName: Pokeathlon Stat Name
     */
    public static func fetchPokeathlonStat(_ pokeathlonStatName: String, completion: @escaping (_ result: Result<PKMPokeathlonStat, HTTPError>) -> Void) {
        let urlStr = baseURL + "/pokeathlon-stat/\(pokeathlonStatName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon list
     */
    public static func fetchPokemonList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMPokemon {
        let urlStr = baseURL + "/pokemon"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Pokemon Information
     
     - parameter pokemonId: Pokemon ID
     */
    public static func fetchPokemon(_ pokemonId: Int, completion: @escaping (_ result: Result<PKMPokemon, HTTPError>) -> Void) {
        let urlStr = baseURL + "/pokemon/\(pokemonId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon Information
     
     - parameter pokemonName: Pokemon Name
     */
    public static func fetchPokemon(_ pokemonName: String, completion: @escaping (_ result: Result<PKMPokemon, HTTPError>) -> Void) {
        let urlStr = baseURL + "/pokemon/\(pokemonName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon Color list
     */
    public static func fetchPokemonColorList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMPokemonColor {
        let urlStr = baseURL + "/pokemon-color"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Pokemon Color Information
     
     - parameter pokemonColorId: Pokemon Color ID
     */
    public static func fetchPokemonColor(_ pokemonColorId: Int, completion: @escaping (_ result: Result<PKMPokemonColor, HTTPError>) -> Void) {
        let urlStr = baseURL + "/pokemon-color/\(pokemonColorId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon Color Information
     
     - parameter pokemonColorName: Pokemon Color Name
     */
    public static func fetchPokemonColor(_ pokemonColorName: String, completion: @escaping (_ result: Result<PKMPokemonColor, HTTPError>) -> Void) {
        let urlStr = baseURL + "/pokemon-color/\(pokemonColorName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon Form list
     */
    public static func fetchPokemonFormList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMPokemonForm {
        let urlStr = baseURL + "/pokemon-form"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Pokemon Form Information
     
     - parameter pokemonFormId: Pokemon Form ID
     */
    public static func fetchPokemonForm(_ pokemonFormId: Int, completion: @escaping (_ result: Result<PKMPokemonForm, HTTPError>) -> Void) {
        let urlStr = baseURL + "/pokemon-form/\(pokemonFormId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon Form Information
     
     - parameter pokemonFormName: Pokemon Form Name
     */
    public static func fetchPokemonForm(_ pokemonFormName: String, completion: @escaping (_ result: Result<PKMPokemonForm, HTTPError>) -> Void) {
        let urlStr = baseURL + "/pokemon-form/\(pokemonFormName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon Habitat list
     */
    public static func fetchPokemonHabitatList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMPokemonHabitat {
        let urlStr = baseURL + "/pokemon-habitat"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Pokemon Habitat Information
     
     - parameter pokemonHabitatId: Pokemon Habitat ID
     */
    public static func fetchPokemonHabitat(_ pokemonHabitatId: Int, completion: @escaping (_ result: Result<PKMPokemonHabitat, HTTPError>) -> Void) {
        let urlStr = baseURL + "/pokemon-habitat/\(pokemonHabitatId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon Habitat Information
     
     - parameter pokemonHabitatName: Pokemon Habitat Name
     */
    public static func fetchPokemonHabitat(_ pokemonHabitatName: String, completion: @escaping (_ result: Result<PKMPokemonHabitat, HTTPError>) -> Void) {
        let urlStr = baseURL + "/pokemon-habitat/\(pokemonHabitatName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon Shape list
     */
    public static func fetchPokemonShapeList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMPokemonShape {
        let urlStr = baseURL + "/pokemon-shape"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Pokemon Shape Information
     
     - parameter pokemonShapeId: Pokemon Shape ID
     */
    public static func fetchPokemonShape(_ pokemonShapeId: Int, completion: @escaping (_ result: Result<PKMPokemonShape, HTTPError>) -> Void) {
        let urlStr = baseURL + "/pokemon-shape/\(pokemonShapeId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon Shape Information
     
     - parameter pokemonShapeName: Pokemon Shape Name
     */
    public static func fetchPokemonShape(_ pokemonShapeName: String, completion: @escaping (_ result: Result<PKMPokemonShape, HTTPError>) -> Void) {
        let urlStr = baseURL + "/pokemon-shape/\(pokemonShapeName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon Species list
     */
    public static func fetchPokemonSpeciesList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMPokemonSpecies {
        let urlStr = baseURL + "/pokemon-species"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Pokemon Species Information
     
     - parameter pokemonSpeciesId: Pokemon Species ID
     */
    public static func fetchPokemonSpecies(_ pokemonSpeciesId: Int, completion: @escaping (_ result: Result<PKMPokemonSpecies, HTTPError>) -> Void) {
        let urlStr = baseURL + "/pokemon-species/\(pokemonSpeciesId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon Species Information
     
     - parameter pokemonSpeciesName: Pokemon Species Name
     */
    public static func fetchPokemonSpecies(_ pokemonSpeciesName: String, completion: @escaping (_ result: Result<PKMPokemonSpecies, HTTPError>) -> Void) {
        let urlStr = baseURL + "/pokemon-species/\(pokemonSpeciesName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Stat list
     */
    public static func fetchStatList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMStat {
        let urlStr = baseURL + "/stat"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Stat Information
     
     - parameter statId: Stat ID
     */
    public static func fetchStat(_ statId: Int, completion: @escaping (_ result: Result<PKMStat, HTTPError>) -> Void) {
        let urlStr = baseURL + "/stat/\(statId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Stat Information
     
     - parameter statName: Stat Name
     */
    public static func fetchStat(_ statName: String, completion: @escaping (_ result: Result<PKMStat, HTTPError>) -> Void) {
        let urlStr = baseURL + "/stat/\(statName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Type list
     */
    public static func fetchTypeList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMType {
        let urlStr = baseURL + "/type"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Type Information
     
     - parameter typeId: Type ID
     */
    public static func fetchType(_ typeId: Int, completion: @escaping (_ result: Result<PKMType, HTTPError>) -> Void) {
        let urlStr = baseURL + "/type/\(typeId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Type Information
     
     - parameter typeName: Type Name
     */
    public static func fetchType(_ typeName: String, completion: @escaping (_ result: Result<PKMType, HTTPError>) -> Void) {
        let urlStr = baseURL + "/type/\(typeName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
}
