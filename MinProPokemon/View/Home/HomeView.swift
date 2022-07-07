//
//  HomeView.swift
//  MinProPokemon
//
//  Created by Hafizh Caesandro Kevinoza on 30/06/22.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @State private var  pokemon = [Pokemon]()
    
    var columns = Array(repeating: GridItem(.flexible()), count: 3)
    @State var text = ""
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack (alignment: .center){
                    Text("Pokemon List".uppercased())
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: 15) {
                            
                            ForEach(searchText == ""
                                    ? pokemon: pokemon.filter({$0.name.lowercased().contains(searchText.lowercased())})
                                    , id:\.self ) {
                                pkmn in
                                
                                NavigationLink(destination:DetailsView(detailPokemon: pkmn, index: getIndexOf(pkmn))) {
                                    
                                    PokemonCell(url: pkmn.url, name: pkmn.name, index: self.getIndexOf(pkmn))
                                    
                                }
                                
                            }
                        }
                    }
                    
                }.padding(.horizontal, 2)
            }
            
            .onAppear {
                NetworkingProvider.share.getPokemons { pokemon in
                    
                    self.pokemon = pokemon
                } failure: { error in
                    print(error)
                }
                
            }
        }
    }
    
    func getIndexOf(_ pokemonMember: Pokemon) -> Int {
        if let ndx = pokemon.firstIndex(of: pokemonMember) {
            return Int(ndx)
        } else {
            return -1
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
