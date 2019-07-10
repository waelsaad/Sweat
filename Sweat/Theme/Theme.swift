//
//  Theme.swift
//  Sweat
//
//  Created by r00tdvd on 7/6/19.
//  Copyright © 2019 r00tdvd. All rights reserved.
//

import UIKit.UIColor

struct Theme {
  struct Font {}
  struct Color {}
  struct Paragraph {}
  struct StringAttributes {}
  struct Buttons {}
}

extension UIColor {
  private static func colorFrom(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
    return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
  }

  static let grey333: UIColor = UIColor.colorFrom(red: 223, green: 223, blue: 223, alpha: 1)
  static let grey337: UIColor = UIColor.colorFrom(red: 232, green: 232, blue: 232, alpha: 1)
}

extension Theme.Color {
    static let labelBorderColor: UIColor = .grey333
}
