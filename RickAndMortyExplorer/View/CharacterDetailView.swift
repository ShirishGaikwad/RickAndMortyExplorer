//
//  CharacterDetailView.swift
//  RickAndMortyExplorer
//
//  Created by shirish gayakawad on 29/03/25.
//

import SwiftUI
import UIKit

struct CharacterDetailView: UIViewControllerRepresentable {
    let character: Character

    func makeUIViewController(context: Context) -> CharacterDetailViewController {
        let viewController = CharacterDetailViewController()
        viewController.character = character
        return viewController
    }

    func updateUIViewController(_ uiViewController: CharacterDetailViewController, context: Context) {
            uiViewController.character = character
            uiViewController.navigationItem.title = character.name.uppercased()
        }
}

class CharacterDetailViewController: UIViewController {
    var character: Character?

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            setupUI()

            // Ensure title is set after character is assigned
            if let characterName = character?.name {
                self.title = characterName.uppercased()
            }
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            // Update title every time the screen appears
            if let characterName = character?.name {
                self.navigationItem.title = characterName.uppercased()
            }
        }
    private func setupUI() {
        guard let character = character else { return }

        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        if let url = URL(string: character.image) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageView.image = image
                    }
                }
            }
        }

        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = character.name
        nameLabel.font = .boldSystemFont(ofSize: 24)
        nameLabel.textAlignment = .center

        view.addSubview(imageView)
        view.addSubview(nameLabel)

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 600),
            imageView.heightAnchor.constraint(equalToConstant: 300),

            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
