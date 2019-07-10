//
//  TagsCollectionView.swift
//  Sweat
//
//  Created by Wael Saad - r00tdvd on 7/6/19.
//  Copyright © 2019 r00tdvd. All rights reserved.
//

import UIKit

@IBDesignable
final class TagsCollectionView: UICollectionView, ViewWithNib, Reusable {
    
    // MARK: Private
    
    private var tags: [TagsCollectionViewDisplayModel] = []
    
    // MARK: - Outlets
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
    }
    
    func reload(with tags: [TagsCollectionViewDisplayModel]) {
        self.tags = tags
        reloadData()
        layoutIfNeeded()
    }
    
    // MARK: - Configure View
    
    func configureCollectionView() {
        delegate = self
        dataSource = self
        register(forClass: TagCollectionViewCell.self)
        //self.collectionViewLayout = makeLayout()
    }
    
    private func makeLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: Constants.collectionCellWidth, height: Constants.collectionCellHeight)
        flowLayout.sectionInset = UIEdgeInsets.init(top: Constants.collectionViewTopInset,
                                                    left: Constants.collectionViewRightInset,
                                                    bottom: Constants.collectionViewBottomInset,
                                                    right: Constants.collectionViewLeftInset)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = Constants.collectionCellSpacing
        return flowLayout
    }
}

// MARK: - UICollectionViewDataSource

extension TagsCollectionView: UICollectionViewDataSource {
    
    func numberOfSections(in _: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TagCollectionViewCell = dequeueReusableCell(forClass: TagCollectionViewCell.self, indexPath: indexPath)
        cell.configure(with: tags[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension TagsCollectionView: UICollectionViewDelegate {
    
    
}

private enum Constants {
    static let collectionCellWidth: CGFloat = 70
    static let collectionCellHeight: CGFloat = 25
    static let collectionViewTopInset: CGFloat = 10
    static let collectionViewBottomInset: CGFloat = 0
    static let collectionViewRightInset: CGFloat = 0
    static let collectionViewLeftInset: CGFloat = 0
    static let collectionCellSpacing: CGFloat = 3
}

struct TagsCollectionViewDisplayModel {
    let name: String!
    
    init(name: String!) {
        self.name = name
    }
}

