//
//  UITableView+CellRegistration.swift
//  Sweat
//
//  Created by Wael Saad - r00tdvd on 7/6/19.
//  Copyright © 2019 r00tdvd. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
  func register(forClass aClass: AnyClass) {
    let className = String(describing: aClass)
    register(UINib(nibName: className, bundle: Bundle.main), forCellReuseIdentifier: className)
  }

  func register(forClass aClass: AnyClass, nibName: String) {
    let className = String(describing: aClass)
    register(UINib(nibName: nibName, bundle: Bundle.main), forCellReuseIdentifier: className)
  }

  func dequeueReusableCell<T: UITableViewCell>(forClass aClass: AnyClass) -> T {
    let className = String(describing: aClass)

    guard let cell = dequeueReusableCell(withIdentifier: className) as? T else {
      fatalError("Cannot deque cell for class \(aClass)")
    }

    return cell
  }
}
