//
//  ViewController.swift
//  PopupContainerView
//
//  Created by Simon McNeil on 2024-04-27.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    private lazy var presentViewButton: UIButton = {
        let button = UIButton(configuration: .borderedProminent())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Click Me", for: .normal)
        button.addTarget(self, action: #selector(presentView), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(presentViewButton)
        view.backgroundColor = .systemTeal
        configure()
    }

    func configure() {
        NSLayoutConstraint.activate([
            presentViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentViewButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func presentView() {
        let hostingController = UIHostingController(rootView: PresentContainerView(useScrollView: true, contentView: {
            ContainerView()
        }))

        hostingController.view.backgroundColor = .clear
        hostingController.modalPresentationStyle = .pageSheet
        hostingController.modalTransitionStyle = .coverVertical
        present(hostingController, animated: true, completion: nil)
    }
}

