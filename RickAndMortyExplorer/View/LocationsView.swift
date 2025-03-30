//
//  LocationsView.swift
//  RickAndMortyExplorer
//
//  Created by shirish gayakawad on 29/03/25.
//

import SwiftUI

struct LocationsView: View {
    @StateObject private var viewModel = LocationsViewModel()

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.locations) { location in
                        NavigationLink(destination: LocationDetailView(location: location)) {
                            VStack {
                                Image(systemName: "map.fill") // Placeholder icon for locations
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 140, height: 100)
                                    .foregroundColor(.blue)

                                Text(location.name)
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(2)

                                Text(location.type)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(12)
                            .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Locations")
            .onAppear {
                viewModel.fetchLocations()
            }
        }
    }
}


#Preview {
    LocationsView()
}
