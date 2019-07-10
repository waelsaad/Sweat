//
//  Tags.swift
//  Sweat
//
//  Created by Wael Saad - r00tdvd on 7/6/19.
//  Copyright © 2019 r00tdvd. All rights reserved.
//

import Foundation

public struct Tag: Codable {
    
    public let id: Int
    public let name: String?
    
    public let tagType: TagType?
    
    private enum CodingKeys: String, CodingKey {
        case id, name
    }
    
    public init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        
        //Handle Enumeration Types
        tagType = try values.decodeIfPresent(TagType.self, forKey: .id)
    }
}

public enum TagType: Int, Codable {

    case unknown = -1
    
    case equipmentNeeded = 129
    case outdoors = 128
    case home = 126
    case gym = 127
    case mins_28_40 = 130
    case yogaMat = 140
    case medicineBall = 145
    case sweatTowel = 150
    
    public init(from decoder: Decoder) throws {
        self = try TagType(rawValue: decoder.singleValueContainer().decode(Int.self)) ?? .unknown
    }
}
