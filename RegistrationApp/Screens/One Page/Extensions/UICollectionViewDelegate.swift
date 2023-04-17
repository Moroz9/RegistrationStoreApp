//
//  UICollectionViewDelegate.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 17.04.23.
//

import UIKit
// MARK: - ProfileViewController

extension OnePageVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return MockData.shared.pageData.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MockData.shared.pageData[section].count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch MockData.shared.pageData[indexPath.section] {
        case .category(let items):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Resources.CollectionViewCell.categorypeCollectionViewCell,
                  for: indexPath) as? CategorypeCollectionViewCell else { return UICollectionViewCell()}
            cell.configureCell(categoryName: items[indexPath.row].image, imageName: items[indexPath.row].image)
            return cell
        case .latest(let items):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Resources.CollectionViewCell.latestCollectionViewCell,
                for: indexPath) as? LatestCollectionViewCell else { return UICollectionViewCell()}
            cell.configureCe11(categoryName: items[indexPath.row].title, imageName: items[indexPath.row].image)
            return cell
        case .flashSale(let items):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Resources.CollectionViewCell.fastSaleCollectionViewCell,
                 for: indexPath) as? FastSaleCollectionViewCell else { return UICollectionViewCell()}
            cell.configureCe11(categoryName: items[indexPath.row].title, imageName: items[indexPath.row].image)
            return cell
        case .brands(let items):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Resources.CollectionViewCell.brendsCollectionViewCell,
                for: indexPath) as? BrendsCollectionViewCell else { return UICollectionViewCell()}
            cell.configureCe11(categoryName: items[indexPath.row].title, imageName: items[indexPath.row].image)
            return cell
        }
    }
func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: Resources.CollectionViewCell.collectionViewHeaderReusableView,
                for: indexPath) as? CollectionViewHeaderReusableView else { return UICollectionReusableView()}
            header.configureHeader(categoryName: MockData.shared.pageData[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}
