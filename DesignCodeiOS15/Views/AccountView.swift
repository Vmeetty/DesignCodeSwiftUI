//
//  AccountView.swift
//  DesignCodeiOS15
//
//  Created by admin on 2/4/23.
//

import SwiftUI

struct AccountView: View {
    
    @State var webIsDeleted = false
    @State var youtubeIsDeleted = false
    
    var body: some View {
        NavigationView {
            List {
                profile
                menu
                links
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
    
    var profile: some View {
        VStack {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    BlobView()
                        .offset(x: 300, y: 0)
                        .scaleEffect(0.5)
                )
            Text("Vlad Chuvashov")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.small)
                    .foregroundColor(.secondary)
                Text("Ukraine")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    var menu: some View {
        Section {
            NavigationLink {
                HomeView()
            } label: {
                Label("Settings", systemImage: "gear")
            }
            NavigationLink {
                HomeView()
            } label: {
                Label("Billing", systemImage: "creditcard")
            }
            NavigationLink {
                ContentView()
            } label: {
                Label("Help", systemImage: "questionmark")
            }
        }
        .listRowSeparator(.hidden)
        .listItemTint(.primary)
    }
    
    var links: some View {
        Section {
            if !webIsDeleted {
                Link(destination: URL(string: "http://apple.com")!) {
                    HStack {
                        Label("Website", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    Button {
                        webIsDeleted = true
                    } label: {
                        Image(systemName: "trash")
                            .foregroundColor(.white)
                    }
                    .tint(.red)
                }
            }
            if !youtubeIsDeleted {
                Link(destination: URL(string: "http://youtube.com")!) {
                    HStack {
                        Label("YouTube", systemImage: "tv")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    Button {
                        youtubeIsDeleted = true
                    } label: {
                        Image(systemName: "trash")
                            .foregroundColor(.white)
                    }
                    .tint(.red)
                }
            }
        }
        .listRowSeparator(.hidden)
        .foregroundColor(.primary)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
