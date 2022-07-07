//
//  DetailResponse.swift
//  MinProPokemon
//
//  Created by Hafizh Caesandro Kevinoza on 30/06/22.
//

import Foundation

struct PokemonDescription: Codable {
    let flavor_text_entries: [FlavorTextEntries]
}

struct FlavorTextEntries: Codable {
    let flavor_text: String
    let language: Language
}

struct Language: Codable {
    var name: String?
    var url: String?
}
