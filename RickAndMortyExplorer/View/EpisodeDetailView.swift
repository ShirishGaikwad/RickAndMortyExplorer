//
//  EpisodeDetailView.swift
//  RickAndMortyExplorer
//
//  Created by shirish gayakawad on 29/03/25.
//

import SwiftUI
import UIKit

struct EpisodeDetailView: UIViewControllerRepresentable {
    let episode: Episode

    func makeUIViewController(context: Context) -> EpisodeDetailViewController {
        let viewController = EpisodeDetailViewController()
        viewController.episode = episode
        return viewController
    }

    func updateUIViewController(_ uiViewController: EpisodeDetailViewController, context: Context) {}
}

class EpisodeDetailViewController: UIViewController {
    var episode: Episode?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        guard let episode = episode else { return }

        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = episode.name
        nameLabel.font = .boldSystemFont(ofSize: 24)
        nameLabel.textAlignment = .center

        let episodeCodeLabel = UILabel()
        episodeCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        episodeCodeLabel.text = "Episode Code: \(episode.episode)"
        episodeCodeLabel.font = .systemFont(ofSize: 18)
        episodeCodeLabel.textAlignment = .center

        let airDateLabel = UILabel()
        airDateLabel.translatesAutoresizingMaskIntoConstraints = false
        airDateLabel.text = "Air Date: \(episode.air_date)"
        airDateLabel.font = .systemFont(ofSize: 18)
        airDateLabel.textAlignment = .center

        view.addSubview(nameLabel)
        view.addSubview(episodeCodeLabel)
        view.addSubview(airDateLabel)

        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),

            episodeCodeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            episodeCodeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),

            airDateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            airDateLabel.topAnchor.constraint(equalTo: episodeCodeLabel.bottomAnchor, constant: 10)
        ])
    }
}
