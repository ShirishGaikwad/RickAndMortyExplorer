//
//  EpisodeViewModel.swift
//  RickAndMortyExplorer
//
//  Created by shirish gayakawad on 29/03/25.
//

import Foundation

class EpisodesViewModel: ObservableObject {
    @Published var episodes: [Episode] = []

    func fetchEpisodes() {
        let url = "https://rickandmortyapi.com/api/episode"
        APIClient.fetchData(url: url) { (response: APIResponse?) in
            DispatchQueue.main.async {
                self.episodes = response?.results ?? []
            }
        }
    }
}
