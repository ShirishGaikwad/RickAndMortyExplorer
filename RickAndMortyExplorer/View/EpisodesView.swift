//
//  EpisodesView.swift
//  RickAndMortyExplorer
//
//  Created by shirish gayakawad on 29/03/25.
//

import SwiftUI

struct EpisodesView: View {
    @StateObject private var viewModel = EpisodesViewModel()

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.episodes) { episode in
                        NavigationLink(destination: EpisodeDetailView(episode: episode)) {
                            VStack(alignment: .leading) {
                                Text(episode.name)
                                    .font(.headline)
                                    .lineLimit(1)
                                    .multilineTextAlignment(.center)

                                Text("Code: \(episode.episode)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)

                                Text("Air Date: \(episode.air_date)")
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
            .navigationTitle("Episodes")
            .onAppear {
                viewModel.fetchEpisodes()
            }
        }
    }
}

#Preview {
    EpisodesView()
}
