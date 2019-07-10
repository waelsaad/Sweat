//
//  TagCollectionViewCell.swift
//  Sweat
//
//  Created by Wael Saad - r00tdvd on 7/6/19.
//  Copyright © 2019 r00tdvd. All rights reserved.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell, ViewWithNib, Reusable {

  // MARK: - Outlets

    @IBOutlet weak var tagLabel: UILabel! {
        didSet {
            tagLabel.numberOfLines = 0
            tagLabel.layer.borderWidth = 1
            tagLabel?.layer.masksToBounds = true
            tagLabel.layer.borderColor = Theme.Color.labelBorderColor.cgColor
            tagLabel.layer.cornerRadius = Constants.cornerRadius
        }
    }

  // MARK: - Configure View

  func configure(with tag: TagsCollectionViewDisplayModel) {
    tagLabel.text = tag.name
    //tagLabel?.sizeToFit()
  }

  override func prepareForReuse() {
    super.prepareForReuse()
  }
}

private enum Constants {
    static let cornerRadius: CGFloat = 5
}
