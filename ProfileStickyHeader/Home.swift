//
//  Home.swift
//  Home
//
//  Created by 风起兮 on 2021/8/11.
//

import SwiftUI

struct Home: View {
    
    //  First Tab Image...
    @State var selectedTab: String = "square.grid.3x3"
    //  Smooth Sliding Effect
    @Namespace var animtion
    
    // For Drak Mode Adoption...
    @Environment(\.colorScheme) var colorScheme
    
    // Offset For Sticky Segmeted Picker...
    @State var topHeaderOffset: CGFloat = 0
    
    @State var items: [Color] = (1...19).map { _ in Color.random }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack(spacing: 15) {
                
                Button(action: {}) {
                    Image(systemName: "loupe")
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "hammer.circle")
                }
                
                Button(action: {}) {
                    Image(systemName: "gear.circle")
                }

            }
            .padding()
            .background(.bar)
            // Sinece we need bottom value...
            .overlay(alignment: .bottom) {
                //  logic is when the picker reaches the header Bottom then were sticking the picker to header...
                GeometryReader { proxy -> Color in
                    
                    let minY = proxy.frame(in: .global).minY
                    
                    DispatchQueue.main.async {
                        if topHeaderOffset == 0 {
                            topHeaderOffset = minY
                        }
                    }
                    
                    return .clear
                }
                .frame(width: 0, height: 0)
            }
                
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    
                    Divider()
                    
                    HStack {
                        
                        //  Plus Button At Right Bottom
                        
                        Button(action: {}) {
                            
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70, height: 70)
                                .overlay(alignment: .bottomTrailing) {
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                        .padding(6)
                                        .background(.blue)
                                        .clipShape(Circle())
                                        .padding(2)
                                        .background(.white)
                                        .clipShape(Circle())
                                        .offset(x: 5, y: 5)
                                }
                        }
                        
                        VStack {
                            Text("199")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Text("Posts")
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack {
                            Text("2099")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Text("Followers")
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack {
                            Text("13")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Text("Following")
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity)
                        
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("ilumanxi . iOS & Swiftui Dev")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Text("Video Creator")
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                        
                        Text("Easy and Great tutorial for working with #swift with new and innovative ideas to improve your skills. Click the linke below for more")
                        
                        Link(destination: URL(string: "https://github.com/ilumanxi")!) {
                            Text("Link")
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    // Edit Profile Button...
                    
                    HStack(spacing: 10) {
                        Button(action: {}) {
                            Text("Edit Profile")
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.gray)
                            )
                        }
                        
                        Button(action: {}) {
                            Text("Promotion's")
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                                .background(
                                    
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.gray)
                            )
                        }
                    }
                    .padding([.horizontal, .top])
                    
                    // Stories Sections...
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(spacing: 15) {
                            
                            Button(action: {}) {
                                VStack {
                                    Image(systemName: "plus")
                                        .font(.title2)
                                        .foregroundColor(.primary)
                                        .padding(18)
                                        .background(Circle().stroke(Color.gray))
                                    
                                    Text("New")
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                        .padding([.horizontal, .top])
                    }
                    
                    GeometryReader { proxy -> AnyView in
                        
                        let minY = proxy.frame(in: .global).minY
                        
                        let offset = minY - topHeaderOffset
                        
                        print("\(topHeaderOffset) = \(minY) -> \(offset)")
                        return AnyView(
                            //  Sticky Top Segmented Bar...
                            HStack(spacing: 0) {

                                TabBarButton(image: "square.grid.3x3", isSystemImage: true, animation: animtion, selectedTab: $selectedTab)

                                TabBarButton(image: "video", isSystemImage: true, animation: animtion, selectedTab: $selectedTab)

                                TabBarButton(image: "music.note", isSystemImage: true, animation: animtion, selectedTab: $selectedTab)
                            }
                            //  Max  Frame...
                            // Conisered as padding...
                            .frame(height: 60, alignment: .bottom)
                            .background(colorScheme == .dark ? .black : .white)
                                .offset(y: offset < 0 ? -offset : 0)
                            
                        )
                    }
                    .frame(height: 60)
                    //  Moving View to top...
                    .zIndex(4)

                    //  Your Tab Views...
                    
                    ZStack {
                        //  I'm Simply Using One Temp View
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 2), count: 3), spacing: 2) {
                            
                            ForEach(0..<items.count, id: \.self) { index in
                                
                                //   For Getting Width For Image...
                                GeometryReader { proxy in
                                    let width = proxy.frame(in: .global).width
                                    ImageView(color: items[index], width: width)
                                }
                                .frame(height: 120)
                                
                            }
                        }
                    }
                }
            }
        }
    }
}




extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}




struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
