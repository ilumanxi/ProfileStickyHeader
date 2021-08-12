//
//  TabBarButton.swift
//  TabBarButton
//
//  Created by 风起兮 on 2021/8/12.
//

import SwiftUI

struct TabBarButton: View {
    
    var image: String
    //  Since we're having asset Image...
    var isSystemImage: Bool
    var animation: Namespace.ID
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut) {
                selectedTab = image
            }
        }) {
            VStack(spacing: 12) {
                (
                    isSystemImage ? Image(systemName: image) : Image(image)
                )
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                    .foregroundColor(selectedTab == image ? .primary : .gray)

                ZStack {

                    if selectedTab == image {
                        Rectangle()
                            .fill(.primary)
                        // For Smooth sliding effect...
                            .matchedGeometryEffect(id: "Tab", in: animation)
                    }
                    else {
                        Rectangle()
                            .fill(.clear)
                    }
                }
                .frame(height: 1)
            }
            
        }
    }
}
