//
//  APIServiceProtocol.swift
//  MinProPokemon
//
//  Created by Hafizh Caesandro Kevinoza on 30/06/22.
//

import Foundation

protocol APIServiceProtocol {
    func getPokemons( success: @escaping (_ pokemon: [Pokemon]) -> (), failure: @escaping (_ error: Error?) -> () )
    
    func getSprite(url: String, success: @escaping (PokemonSprites) -> ())
    
    func getFlavorTextEntry(index: Int, success: @escaping (_ flavorTextEntry: String?) -> (), failure: @escaping (_ error: Error?) -> () )
}
