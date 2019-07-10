//
//  Program.swift
//  Sweat
//
//  Created by Wael Saad - r00tdvd on 7/6/19.
//  Copyright © 2019 r00tdvd. All rights reserved.
//

import UIKit
import Foundation

public struct Program: Codable {
    public let id: Int?
    public let acronym: String?
    public let code_name: String?
    public let name: String?
    public let image: URL?
    
    public let tags: [Tag]?
    public let trainer: Trainer?
    public let attributes: [Attribute]?

    private enum CodingKeys: String, CodingKey {
        case id, acronym, code_name, name, image, tags, trainer, attributes
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        acronym = try values.decodeIfPresent(String.self, forKey: .acronym)
        code_name = try values.decodeIfPresent(String.self, forKey: .code_name)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        image = try values.decodeIfPresent(URL.self, forKey: .image)
        
        tags = try values.decodeIfPresent([Tag].self, forKey: .tags)
        trainer = try values.decodeIfPresent(Trainer.self, forKey: .trainer)
        attributes = try values.decodeIfPresent([Attribute].self, forKey: .attributes)
    }
}

