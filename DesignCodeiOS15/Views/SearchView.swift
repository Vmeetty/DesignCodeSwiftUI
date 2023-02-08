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
            ScrollView {
                VStack {
                    content
                }
                .padding(20)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                .strokeStyle(cornerRadius: 30)
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.regularMaterial)
                        .frame(height: 200)
                        .offset(y: -200)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .blur(radius: 20)
                )
                .background(Image("Blob 1").offset(x: -100, y: -200))
            }
            .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always), prompt: "Swift, SwiftUI, Design...") {
                ForEach(suggestions) { suggestion in
                    Button {
                        text = suggestion.text
                    } label: {
                        Text(suggestion.text)
                            .searchCompletion(suggestion.text)
                    }
                }
            }
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
    
    var content: some View {
        ForEach (courses.filter({ $0.title.contains(text) || text == "" })) { item in
            HStack(alignment: .top, spacing: 12) {
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 44, height: 44)
                    .background(Color("Background"))
                    .mask(Circle())
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title).bold()
                    Text(item.text)
                        .foregroundColor(.secondary)
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding(.vertical, 4)
            .listRowSeparator(.hidden)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
