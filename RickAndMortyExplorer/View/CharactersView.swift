//
//  ContentView.swift
//  RickAndMortyExplorer
//
//  Created by shirish gayakawad on 29/03/25.
//

import SwiftUI

struct CharactersView: View {
    @StateObject private var viewModel = CharactersViewModel()

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.characters) { character in
                        NavigationLink(destination: CharacterDetailView(character: character)) {
                            VStack {
                                // Image display
                                AsyncImage(url: URL(string: character.image)) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image.resizable()
                                            .scaledToFit()
                                            .frame(width: 140, height: 100)
                                            .clipShape(Circle())
                                    case .failure:
                                        Image(systemName: "photo")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .clipShape(Circle())
                                    case .empty:
                                        ProgressView()
                                    @unknown default:
                                        EmptyView()
                                    }
                                }

                                // Name and status display
                                Text(character.name)
                                    .font(.headline)
                                    .lineLimit(1)
                                    .multilineTextAlignment(.center)

                                Text(character.status)
                                    .font(.subheadline)
                                    .foregroundColor(character.status.lowercased() == "alive" ? .green : (character.status.lowercased() == "dead" ? .red : .gray))
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
            .navigationTitle("Characters")
            .onAppear {
                viewModel.fetchCharacters()
            }
        }
    }
}

#Preview {
    CharactersView()
}
