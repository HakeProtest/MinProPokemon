//
//  DetailsView.swift
//  MinProPokemon
//
//  Created by Hafizh Caesandro Kevinoza on 30/06/22.
//

import SwiftUI

struct DetailsView: View {
    let detailPokemon: Pokemon
    let index: Int
    @State private var flavorTextEntry = ""
    @State private var shapeText = ""
    
    var body: some View {
        ZStack{
            ScrollView {
                Text(detailPokemon.name.uppercased())
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 50)
                
                ImageView(detailPokemon: self.detailPokemon, index: self.index)
                    .clipShape(Circle())
                    .overlay(Circle().strokeBorder(Color(uiColor: .white), lineWidth: 5))
                
                Spacer(minLength: UIScreen.main.bounds.width * 0.2)
                
                DescriptionView(descriptionText: flavorTextEntry)
            }
        }
        
        .padding()
        .frame(maxHeight: .infinity, alignment: .bottom)
        .edgesIgnoringSafeArea([.top, .bottom])
        
        .onAppear {
            NetworkingProvider.share.getFlavorTextEntry(index: self.index) { entry in
                guard let response = entry else { return
                }
                flavorTextEntry = response
            } failure: { error in
                print(error)
            }
        }
    }
}

struct DescriptionView: View {
    
    var descriptionText: String
    var body: some View {
        VStack (alignment: .leading) {
            Text("Characteristics")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 16)
            
            VStack (alignment: .leading) {
                Text("Move")
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                
                // MARK: move sini, cek api cara na
                // https://pokeapi.co/api/v2/move/
                Text("Move #1")
                    .opacity(0.6)
                Text("Move #2")
                    .opacity(0.6)
                Text("Move #3")
                    .opacity(0.6)
            }
            
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            VStack (alignment: .leading) {
                Text("Type")
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                
                // MARK: move sini, cek api cara na
                // https://pokeapi.co/api/v2/type/
                Text("Type #1")
                    .opacity(0.6)
                Text("Type #2")
                    .opacity(0.6)
                Text("Type #3")
                    .opacity(0.6)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .offset(x: 0, y: -30.0)
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(detailPokemon: Pokemon.init( name: "charizard", url: Service.allPokemonList+"/5"), index: 5)
    }
}
