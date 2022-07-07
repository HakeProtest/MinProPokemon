//
//  Service.swift
//  MinProPokemon
//
//  Created by Hafizh Caesandro Kevinoza on 30/06/22.
//

import Foundation

enum Service {
    static let baseUrl = "https://pokeapi.co/api/v2/"
    static let baseUrlImageSprite = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
    static let allPokemonList = Service.baseUrl + "pokemon"
    static let detailedSpecies = Service.baseUrl + "pokemon-species/"
}
