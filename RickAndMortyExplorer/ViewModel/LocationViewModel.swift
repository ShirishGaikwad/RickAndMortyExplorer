//
//  LocationViewModel.swift
//  RickAndMortyExplorer
//
//  Created by shirish gayakawad on 29/03/25.
//

import Foundation

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location] = []

    func fetchLocations() {
        let url = "https://rickandmortyapi.com/api/location"
        APIClient.fetchData(url: url) { (response: APIResponse?) in
            DispatchQueue.main.async {
                self.locations = response?.results ?? []
            }
        }
    }
}
