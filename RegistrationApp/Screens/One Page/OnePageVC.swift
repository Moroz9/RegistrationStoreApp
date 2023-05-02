//
//  OnePageVC.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 14.04.23.
//

import UIKit

final class OnePageVC: UIViewController {
    // MARK: - Let \ Var
    
    private let searchTextField = SearchTextField()
    private let backgroundImageView: UIView = {
        let imageView = UIView()
        imageView.backgroundColor = Color.backgroundView
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
    
    private var category: ListSection = {
        .category([.init(name: "Phones", image: "phone"),
                   .init(name: "Headphones", image: "headphones"),
                   .init(name: "Games", image: "game"),
                   .init(name: "Cars", image: "car"),
                   .init(name: "Furniture", image: "furniture"),
                   .init(name: "Kids", image: "kids")])
    }()
    private var latestItems: [LatestElement] = []
    private var flashSales: [FlashSaleElement] = []
    private var brands: [FlashSaleElement] = []
    var pageData: [ListSection] {
        [category, .latest(latestItems), .flashSale(flashSales)]
    }
    // MARK: - Lifecycle func
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        createCustomNavigationBarPageOne()
        setConstrains()
        setDelegate()
        fetchData()
    }
    
    private func fetchData() {
        fetchLatestCategory()
        fetchFlashSales()
        fetchBrands()
        
        func fetchLatestCategory() {
            let url = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
            NetworkManager.shared.fetchLatestCategoryModel(urlString: url) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let latestItems):
                    DispatchQueue.main.async {
                        self.latestItems = latestItems.latest
                        self.collectionView.reloadData()
                    }

                case .failure(let failure):
                    fatalError(failure.localizedDescription)
                }
            }
        }
        
        func fetchFlashSales() {
            let url = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
            NetworkManager.shared.fetchFlashSalesModel(urlString: url) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let flashSales):
                    DispatchQueue.main.async {
                        self.flashSales = flashSales.flashSale
                        self.collectionView.reloadData()
                    }

                case .failure(let failure):
                    fatalError(failure.localizedDescription)
                }
            }
        }

        func fetchBrands() {
            let url = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
            NetworkManager.shared.fetchBrandsModel(urlString: url) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let brands):
                    DispatchQueue.main.async {
                        self.brands = brands.flashSale
                        self.collectionView.reloadData()
                    }

                case .failure(let failure):
                    fatalError(failure.localizedDescription)
                }
            }
        }
    }
    // MARK: - Flow func
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(searchTextField)
        backgroundImageView.addSubview(collectionView)
        
        let clipPathGroup = createCustomButtonPageOne(imageName: "Image.clippathgroup", selector: #selector (barButtonTapped))
        let customTitleView = createCustomTitleViewPageOne(contactName: updateAttributesText(), contactDescription: "location", contactImage: "Image.imagePhoto")
        navigationItem.leftBarButtonItem = clipPathGroup
        navigationItem.titleView = customTitleView
        
        collectionView.register(CategoryCollectionViewCell.self,
                                forCellWithReuseIdentifier: CollectionViewCell.categoryCollectionViewCell)
        collectionView.register(LatestCollectionViewCell.self,
                                forCellWithReuseIdentifier: CollectionViewCell.latestCollectionViewCell)
        collectionView.register(FlashSalesCollectionViewCell.self,
                                forCellWithReuseIdentifier: CollectionViewCell.fastSaleCollectionViewCell)
        collectionView.register(BrandsCollectionViewCell.self,
                                forCellWithReuseIdentifier: CollectionViewCell.brandsCollectionViewCell)
        collectionView.register(CollectionViewHeaderReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: CollectionViewCell.collectionViewHeaderReusableView)
        
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
            
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            searchTextField.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 56),
            searchTextField.rightAnchor.constraint(equalTo: backgroundImageView.rightAnchor, constant: -56),
            searchTextField.heightAnchor.constraint(equalToConstant: 30),

            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            collectionView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 0)
        ])
    }
}
extension OnePageVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return pageData.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageData[section].items.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch pageData[indexPath.section] {
        case .category(let categories):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.categoryCollectionViewCell,
                  for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell()}
            cell.configureCell(categoryName: categories[indexPath.row].name, imageName: categories[indexPath.row].image)
            return cell
        case .latest(let latest):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.latestCollectionViewCell,
                for: indexPath) as? LatestCollectionViewCell else { return UICollectionViewCell()}
            cell.configureCell(category: latest[indexPath.row].category, name: latest[indexPath.row].name, price: latest[indexPath.row].price, imageUrl: latest[indexPath.row].image_url)
            return cell
        case .flashSale(let flashSale):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.fastSaleCollectionViewCell,
                 for: indexPath) as? FlashSalesCollectionViewCell else { return UICollectionViewCell()}
            cell.configureCell(category: flashSale[indexPath.row].category, name: flashSale[indexPath.row].name,
                               price: flashSale[indexPath.row].price, discount: flashSale[indexPath.row].discount, imageUrl: flashSale[indexPath.row].imageUrl)
            return cell
        }
    }
func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: CollectionViewCell.collectionViewHeaderReusableView,
                for: indexPath) as? CollectionViewHeaderReusableView else { return UICollectionReusableView()}
            header.configureHeader(categoryName: pageData[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}
