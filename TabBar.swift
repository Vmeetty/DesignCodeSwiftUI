//
//  TabBar.swift
//  DesignCodeiOS15
//
//  Created by admin on 2/4/23.
//

import SwiftUI

struct TabBar: View {
    
    @State var selectedTab: Tab = .home
    @State var selectedColor: Color = .teal
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .home:
                    ContentView()
                case .explore:
                    AccountView()
                case .notifications:
                    AccountView()
                case .library:
                    AccountView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack {
                Spacer()
                ForEach(tabBarItems) { item in
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                            selectedTab = item.tab
                            selectedColor = item.color
                        }
                    } label: {
                        VStack(spacing: 0) {
                            Image(systemName: item.imageName)
                                .symbolVariant(.fill)
                                .font(.body.bold())
                                .frame(width: 44, height: 29)
                            Text(item.title)
                                .font(.caption2)
                                .lineLimit(1)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .foregroundColor(selectedTab == item.tab ? .primary : .secondary)
                    .blendMode(selectedTab == item.tab ? .overlay : .normal)
                }
            }
            .padding(.horizontal, 8)
            .padding(.top, 14)
            .frame(height: 88, alignment: .top)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
            .background(
                HStack {
                    if selectedTab == .library { Spacer() }
                    if selectedTab == .explore { Spacer() }
                    if selectedTab == .notifications {
                        Spacer()
                        Spacer()
                    }
                    Circle().fill(selectedColor).frame(width: 88)
                    if selectedTab == .home { Spacer() }
                    if selectedTab == .explore {
                        Spacer()
                        Spacer()
                    }
                    if selectedTab == .notifications { Spacer() }
                }
                    .padding(.horizontal, 8)
            )
            .overlay (
                HStack {
                    if selectedTab == .library { Spacer() }
                    if selectedTab == .explore { Spacer() }
                    if selectedTab == .notifications {
                        Spacer()
                        Spacer()
                    }
                    Rectangle()
                        .fill(selectedColor)
                        .frame(width: 28, height: 5)
                        .cornerRadius(3)
                        .frame(width: 88)
                        .frame(maxHeight: .infinity, alignment: .top)
                    if selectedTab == .home { Spacer() }
                    if selectedTab == .explore {
                        Spacer()
                        Spacer()
                    }
                    if selectedTab == .notifications { Spacer() }
                }
                    .padding(.horizontal, 8)
            )
            .strokeStyle(cornerRadius: 34)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
