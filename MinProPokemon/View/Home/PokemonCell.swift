//
//  PokemonCell.swift
//  MinProPokemon
//
//  Created by Hafizh Caesandro Kevinoza on 30/06/22.
//

import SwiftUI

struct PokemonCell: View {
    var url: String
    var name: String
    let index: Int
    let imageSize: CGFloat = 100
    @State private var  pokemon = [Pokemon]()
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                AsyncImage(url: URL(string:"\(Service.baseUrlImageSprite)\(index+1).png")) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipped()
                            .padding(.top, 10)
                            .padding(.horizontal, 10)
                    } else if phase.error != nil {
                        Text(phase.error?.localizedDescription ?? "error")
                            .foregroundColor(Color.pink)
                            .frame(width: imageSize, height: imageSize)
                    } else {
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                    }
                }
                Text(name)
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .overlay(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.4)))
            }
        }
        .background(Color.gray)
        .cornerRadius(12)
        
    }
    
    func getIndexOf(_ pokemonMember: Pokemon) -> Int {
        if let ndx = pokemon.firstIndex(of: pokemonMember) {
            return Int(ndx)
        } else {
            return -1
        }
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(url: Service.allPokemonList+"/5", name: "charizard", index: 5)
    }
}
