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
    
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: Constants.background)
        element.contentMode = .scaleAspectFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var headerStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var geoButton: UIButton = {
        let element = UIButton(type: .system)
        element.setImage(UIImage(systemName: Constants.geoSF), for: .normal)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var searchTextField: UITextField = {
        let element = UITextField()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var searchButton: UIButton = {
        let element = UIButton(type: .system)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var coditionalmageView: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var tepmStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var tepmLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var tepmTypeLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var cityLabel: UILabel = {
        let element = UILabel()
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
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(headerStackView)
        
        headerStackView.addArrangedSubview(geoButton)
        headerStackView.addArrangedSubview(searchTextField)
        headerStackView.addArrangedSubview(searchButton)
        
        mainStackView.addArrangedSubview(coditionalmageView)
        mainStackView.addArrangedSubview(tepmStackView)
        
        tepmStackView.addArrangedSubview(tepmLabel)
        tepmStackView.addArrangedSubview(tepmTypeLabel)
        
        mainStackView.addArrangedSubview(cityLabel)
        
        tepmLabel.text = "21"
        tepmTypeLabel.text = Constants.celsius
        cityLabel.text = "London"
    }
}

//MARK: - Setup Constraints
extension ViewController {
    private func setupConstrains() {
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
        
        mainStackView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(24)
            
        }
        
//        NSLayoutConstraint.activate([
//            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
//
//            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
//            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
//            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
//            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
//        ])
    }
}
