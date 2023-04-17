//
//  OnePageVC.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 14.04.23.
//

import UIKit

final class OnePageVC: UIViewController {
    // MARK: - Let \ Var
    private let searhTextFild = SearchTextFild()
    private let backgroundImageView: UIView = {
        let imageView = UIView()
        imageView.backgroundColor = Resources.Color.backgroundView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .none
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    // MARK: - Lifecycle funcs

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        createCustomNavigationBarPageOne()
        setConstrains()
        setDelegate()
    }
    // MARK: - Flow funcs
    private func setupViews() {
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(searhTextFild)
        backgroundImageView.addSubview(collectionView)
        
        let clipPathGroup = createCustomButtonPageOne(imageName: Resources.TextNamed.clippathgroup, selector: #selector (barButtonTapped))
         let castomTitleView = createCustomTitleViewPageOne(contactName: "Trade by data",
                                                     contactDescription: Resources.TextNamed.location, contactImage: Resources.TextNamed.imagePhoto)
        navigationItem.leftBarButtonItem = clipPathGroup
        navigationItem.titleView = castomTitleView
        
        collectionView.register(CategorypeCollectionViewCell.self,
                                forCellWithReuseIdentifier: Resources.CollectionViewCell.categorypeCollectionViewCell)
        collectionView.register(LatestCollectionViewCell.self,
                                forCellWithReuseIdentifier: Resources.CollectionViewCell.latestCollectionViewCell)
        collectionView.register(FastSaleCollectionViewCell.self,
                                forCellWithReuseIdentifier: Resources.CollectionViewCell.fastSaleCollectionViewCell)
        collectionView.register(BrendsCollectionViewCell.self,
                                forCellWithReuseIdentifier: Resources.CollectionViewCell.brendsCollectionViewCell)
        collectionView.register(CollectionViewHeaderReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: Resources.CollectionViewCell.collectionViewHeaderReusableView)
        
        collectionView.collectionViewLayout = createLayout()
    }
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    @objc func barButtonTapped() {
        print("tab")
    }
}
// MARK: - OnePageVC

extension OnePageVC {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            searhTextFild.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 120),
            searhTextFild.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 56),
            searhTextFild.rightAnchor.constraint(equalTo: backgroundImageView.rightAnchor, constant: -56),
            searhTextFild.heightAnchor.constraint(equalToConstant: 30),

            collectionView.topAnchor.constraint(equalTo: searhTextFild.bottomAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 0)
        ])
    }
}
