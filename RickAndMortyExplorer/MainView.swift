//
//  MainView.swift
//  RickAndMortyExplorer
//
//  Created by shirish gayakawad on 29/03/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            CharactersView() // Characters Tab
                .tabItem {
                    Label("Characters", systemImage: "person.3.fill")
                }
            
            LocationsView() // Locations Tab
                .tabItem {
                    Label("Locations", systemImage: "map.fill")
                }
            
            EpisodesView() // Episodes Tab
                .tabItem {
                    Label("Episodes", systemImage: "play.tv.fill")
                }
        }
    }
}

#Preview {
    MainView()
}
