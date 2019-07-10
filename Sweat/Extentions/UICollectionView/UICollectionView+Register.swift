//
//  UICollectionView+Register.swift
//  Sweat
//
//  Created by Wael Saad - r00tdvd on 7/6/19.
//  Copyright © 2019 r00tdvd. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {

  func register(forClass aClass: AnyClass) {
    let className = String(describing: aClass)
    register(UINib(nibName: className, bundle: Bundle.main), forCellWithReuseIdentifier: className)
  }
  
  func dequeueReusableCell<T: UICollectionViewCell>(forClass aClass: AnyClass, indexPath: IndexPath) -> T {
    let className = String(describing: aClass)
    
    guard let cell = dequeueReusableCell(withReuseIdentifier: className, for: indexPath) as? T else {
      fatalError("Cannot dequeue cell for class \(aClass)")
    }
    
    return cell
  }
}
