//
//  HuntListView.swift
//  ScavengerHunt
//
//  Created by Satoof Haj on 2025-10-06.
//

import SwiftUI

struct HuntListView: View {
    @State private var huntItems: [HuntItem] = [
        HuntItem(name: "Local Café", clue: "Find the best coffee downtown ☕"),
        HuntItem(name: "Bookstore", clue: "Discover your next adventure 📚"),
        HuntItem(name: "Movie Theater", clue: "Catch the latest blockbuster 🎬")
    ]
    
    var body: some View {
        NavigationView {
            List(huntItems) { item in
                NavigationLink(destination: HuntDetailView(item: item)) {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.clue)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Scavenger Hunt")
        }
    }
}

#Preview {
    HuntListView()
}

