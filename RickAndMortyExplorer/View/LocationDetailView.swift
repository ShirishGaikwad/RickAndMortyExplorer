//
//  LocationDetailView.swift
//  RickAndMortyExplorer
//
//  Created by shirish gayakawad on 29/03/25.
//

import SwiftUI
import UIKit

struct LocationDetailView: UIViewControllerRepresentable {
    let location: Location

    func makeUIViewController(context: Context) -> LocationDetailViewController {
        let viewController = LocationDetailViewController()
        viewController.location = location
        return viewController
    }

    func updateUIViewController(_ uiViewController: LocationDetailViewController, context: Context) {}
}

class LocationDetailViewController: UIViewController {
    var location: Location?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        guard let location = location else { return }

        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = location.name
        nameLabel.font = .boldSystemFont(ofSize: 24)
        nameLabel.textAlignment = .center

        let typeLabel = UILabel()
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.text = "Type: \(location.type)"
        typeLabel.font = .systemFont(ofSize: 18)
        typeLabel.textAlignment = .center

        let dimensionLabel = UILabel()
        dimensionLabel.translatesAutoresizingMaskIntoConstraints = false
        dimensionLabel.text = "Dimension: \(location.dimension)"
        dimensionLabel.font = .systemFont(ofSize: 18)
        dimensionLabel.textAlignment = .center

        view.addSubview(nameLabel)
        view.addSubview(typeLabel)
        view.addSubview(dimensionLabel)

        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),

            typeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),

            dimensionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dimensionLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 10)
        ])
    }
}
