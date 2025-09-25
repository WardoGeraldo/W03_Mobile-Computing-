//
//  ContentView.swift
//  MC_W03_Edward
//
//  Created by student on 25/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("🏡Home Screen").font(.largeTitle)
                NavigationLink("Go To Details"){
                    DetailScreen()
                }
                NavigationLink("Show Items"){
                    ItemScreen()
                }
            }
        }
        .padding()
    }
}

struct ItemScreen: View {
    let items = ["Tomato", "Papaya", "Carrot"]
    var body: some View {
        VStack{
            List(items, id: \.self) { item in
            NavigationLink(destination: ItemDetailScreen(item: item)) {
                    Text(item)
                }
            }
            .navigationDestination(for: String.self) { item in
                ItemDetailScreen(item: item)
            }
            .navigationTitle("Items")
        }
    }
}

struct ItemDetailScreen: View {
    let item: String
    var body: some View {
        VStack{
                Text("Welcome to Item Detail!")
                .font(.title)
                Text("You Selected : \(item)")
            }
        .navigationTitle(item)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct DetailScreen: View {
    var body: some View {
        VStack{
            Text("😘Details Screen")
                .font(.largeTitle)
            Text("You come from home screen!")
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
