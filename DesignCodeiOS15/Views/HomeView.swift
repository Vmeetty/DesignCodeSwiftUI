//
//  HomeView.swift
//  DesignCodeiOS15
//
//  Created by admin on 2/5/23.
//

import SwiftUI

struct HomeView: View {
    @State var hasScrolled = false
    
    var body: some View {
        ZStack {
            
            Color("Background")
                .ignoresSafeArea()
            
            ScrollView {
                scrollDetaction
                featured
                Color.clear.frame(height: 1000)
            }
            .coordinateSpace(name: "Scroll")
            .onPreferenceChange(ScrollPreferenceKey.self ,perform: { value in
                withAnimation(.easeInOut(duration: 0.2)) {
                    hasScrolled = value < 0 ? true : false
                }
            })
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay {
                NavigationBar(hasScrolled: $hasScrolled, title: "Featured")
            }
        }
    }
    
    var scrollDetaction: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("Scroll")).minY)
        }
        .frame(height: 0)
    }
    
    var featured: some View {
        TabView {
            ForEach(courses) { course in
                GeometryReader { proxy in
                    
                    let minX = proxy.frame(in: .global).minX
                    
                    FeaturedItem(course: course)
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color.ShadowColor.opacity(0.3), radius: 10, x: 0, y: 10)
                        .blur(radius: abs(minX) / 40)
                        .overlay {
                            Image(course.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 230)
                                .offset(x: 32, y: -80)
                                .offset(x: minX / 2)
                        }
                }
            }
        }
        .tabViewStyle(.page)
        .frame(height: 430)
        .background(
            Image("Blob 1")
                .offset(x: 250, y: -100)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
