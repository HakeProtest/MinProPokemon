//
//  Pokemon.swift
//  MinProPokemon
//
//  Created by Hafizh Caesandro Kevinoza on 30/06/22.
//

import Foundation

struct Pokemon: Codable, Identifiable, Equatable, Hashable {
    let id = UUID()
    let name: String
    let url: String
}
