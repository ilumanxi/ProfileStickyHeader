//
//  ImageView.swift
//  ImageView
//
//  Created by 风起兮 on 2021/8/12.
//

import SwiftUI

struct ImageView: View {
    
    var url: URL? = URL(string: "https://example.com/icon.png")
    
    let color: Color
    let width: CGFloat
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: 120)
                // Image Problemm
                // If use cornerradius it will solve.
                .cornerRadius(0)
        } placeholder: {
            color
                .frame(width: width, height: 120)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(color: .random, width: 120)
    }
}
