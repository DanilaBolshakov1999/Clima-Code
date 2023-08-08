//
//  ViewController.swift
//  Clima-Code
//
//  Created by iOS - Developer on 30.07.2023.
//

import UIKit
import SnapKit

class WeatherViewController: UIViewController {
    
    //MARK: - UI
    
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
        element.spacing = 10
        element.alignment = .trailing
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var headerStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.alignment = .fill
        element.distribution = .fill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var geoButton: UIButton = {
        let element = UIButton(type: .system)
        element.setImage(UIImage(systemName: Constants.geoSF), for: .normal)
        element.tintColor = .label
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var searchTextField: UITextField = {
        let element = UITextField()
        element.placeholder = Constants.search
        element.borderStyle = .roundedRect
        element.textAlignment = .right
        element.font = .systemFont(ofSize: 25)
        element.textColor = .label
        element.tintColor = .label
        element.backgroundColor = .systemFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var searchButton: UIButton = {
        let element = UIButton(type: .system)
        element.setImage(UIImage(systemName: Constants.searchSF), for: .normal)
        element.tintColor = .label
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var coditionalmageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(systemName: Constants.coditionSF)
        element.tintColor = UIColor(named: Constants.weatherColour)
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
        element.tintColor = .label
        element.font = .systemFont(ofSize: 80, weight: .black)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var tepmTypeLabel: UILabel = {
        let element = UILabel()
        element.tintColor = .label
        element.font = .systemFont(ofSize: 100, weight: .light)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var cityLabel: UILabel = {
        let element = UILabel()
        element.tintColor = .label
        element.font = .systemFont(ofSize: 30)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    let emptyView = UIView()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstrains()
    }
    
    //MARK: - Setup Views
    
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
        mainStackView.addArrangedSubview(emptyView)
        
        tepmLabel.text = "21"
        tepmTypeLabel.text = Constants.celsius
        cityLabel.text = "London"
    }
}

//MARK: - Setup Constraints

extension WeatherViewController {
    private func setupConstrains() {
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()

        }

        mainStackView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(24)

        }
        
        headerStackView.snp.makeConstraints { make in
            make.width.equalToSuperview()

        }
        
        geoButton.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        
        searchButton.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        
        coditionalmageView.snp.makeConstraints { make in
            make.width.height.equalTo(120)
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
//
//            headerStackView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor),
//
//            geoButton.widthAnchor.constraint(equalToConstant: 40),
//            geoButton.heightAnchor.constraint(equalToConstant: 40),
//
//            searchButton.widthAnchor.constraint(equalToConstant: 40),
//            searchButton.heightAnchor.constraint(equalToConstant: 40),
//
//            coditionalmageView.widthAnchor.constraint(equalToConstant: 120),
//            coditionalmageView.heightAnchor.constraint(equalToConstant: 120),
//        ])
    }
}
