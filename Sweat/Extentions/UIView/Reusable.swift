//
//  Reusable.swift
//  Sweat
//
//  Created by Wael Saad - r00tdvd on 7/6/19.
//  Copyright © 2019 r00tdvd. All rights reserved.
//

protocol Reusable {

    static var reuseIdentifier: String { get }
}

extension Reusable {

    static var reuseIdentifier: String { return String(describing: self) }
}
