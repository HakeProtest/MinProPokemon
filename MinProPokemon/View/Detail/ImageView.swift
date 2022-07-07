//
//  ImageView.swift
//  MinProPokemon
//
//  Created by Hafizh Caesandro Kevinoza on 30/06/22.
//

import SwiftUI

struct ImageView: View {
    let detailPokemon: Pokemon
    let index: Int
    let imageSize: CGFloat = 100
    
    var body: some View {
        AsyncImage(url: URL(string: "\(Service.baseUrlImageSprite)\(index+1).png")) { phase in
            if let image = phase.image {
                image.resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.25, alignment: .topLeading)
                    .cornerRadius(55)
                //.background(.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                
            } else if phase.error != nil {
                
                Text(phase.error?.localizedDescription ?? "error")
                    .foregroundColor(Color.green)
                    .frame(width: imageSize, height: imageSize)
            } else {
                ProgressView()
                    .frame(width: imageSize, height: imageSize)
            }
        }
    }
}
