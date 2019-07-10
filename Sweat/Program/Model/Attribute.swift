//
//  Attributes.swift
//  Sweat
//
//  Created by Wael Saad - r00tdvd on 7/6/19.
//  Copyright © 2019 r00tdvd. All rights reserved.
//

import Foundation

public struct Attribute: Codable {
    public let id: Int
    public let code_name: String?
    public let name: String?
    public let value: String?
    public let total: String?
    
    public let attributeType: AttributeType?
    
    private enum CodingKeys: String, CodingKey {
        case id, code_name, name, value, total
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        code_name = try values.decodeIfPresent(String.self, forKey: .code_name)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        value = try values.decodeIfPresent(String.self, forKey: .value)
        total = try values.decodeIfPresent(String.self, forKey: .total)
        
        //Handle Enumeration Types
        attributeType = try values.decodeIfPresent(AttributeType.self, forKey: .id)
    }
}

public enum AttributeType: Int, Codable {
    
    case unknown = -1
    case intensity = 1
    case weightLoss = 2
    case muscle = 3
    case strength = 4
    case fitness = 6
    
    public init(from decoder: Decoder) throws {
        self = try AttributeType(rawValue: decoder.singleValueContainer().decode(Int.self)) ?? .unknown
    }
}
