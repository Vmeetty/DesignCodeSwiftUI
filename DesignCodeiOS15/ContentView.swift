//
//  ContentView.swift
//  DesignCodeiOS15
//
//  Created by admin on 2/3/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer()
            Image("Logo 2")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(20.0)
                .padding(9.0)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
            Text("SwiftUI for iOS15")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            Text("20 sections - 3 hours".uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
            Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
        }
        .padding(.all, 20.0)
        .padding(.vertical, 20.0)
        .frame(height: 350.0)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30.0, style: .continuous))
        .shadow(color: Color.ShadowColor.opacity(0.3), radius: 10, x: 0, y: 10)
        .overlay {
            RoundedRectangle(cornerRadius: 30.0, style: .continuous)
                .stroke(.linearGradient(colors: [.white.opacity(0.2), .black.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        .padding(.horizontal, 20.0)
        .background(
            Image("Blob 1")
                .offset(x: 250, y: -100)
        )
        .overlay {
            Image("Illustration 2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 230)
                .offset(x: 32, y: -80)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
