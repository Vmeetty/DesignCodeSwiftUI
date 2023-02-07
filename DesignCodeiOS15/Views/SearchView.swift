//
//  SearchView.swift
//  DesignCodeiOS15
//
//  Created by admin on 2/7/23.
//

import SwiftUI

struct SearchView: View {
    @State var text: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List {
                ForEach (courses.filter({ $0.title.contains(text) || text == "" })) { item in
                    Text(item.title)
                }
            }
            .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always), prompt: "Swift, SwiftUI, Design...")
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss.callAsFunction()
                    } label: {
                        Text("Done")
                    }

                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
