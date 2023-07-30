//
//  ViewController.swift
//  Clima-Code
//
//  Created by iOS - Developer on 30.07.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //MARK: - UI Properties
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: Constants.background)
        element.contentMode = .scaleAspectFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstrains()
    }
    
    //MARK: - Private Methods
    private func setViews() {
        view.addSubview(backgroundImageView)
    }
}

//MARK: - Setup Constraints
extension ViewController {
    private func setupConstrains() {
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
        
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
}
