//
//  UIImageView+URL.swift
//  Sweat
//
//  Created by Wael Saad - r00tdvd on 7/6/19.
//  Copyright © 2019 r00tdvd. All rights reserved.
//

import UIKit

public extension UIImageView {
  func load(url: URL) {
    DispatchQueue.global().async { [weak self] in
      if let data = try? Data(contentsOf: url) {
        if let image = UIImage(data: data) {
          DispatchQueue.main.async {
            self?.image = image
          }
        }
      }
    }
  }
}
