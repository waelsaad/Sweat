//
//  ProgramClient.swift
//  Sweat
//
//  Created by Wael Saad - r00tdvd on 7/6/19.
//  Copyright © 2019 r00tdvd. All rights reserved.
//

import Foundation

class ProgramClient {
    typealias T = [Program]

    public func fetchPrograms( completion: @escaping (Result<T, Error>) -> Void) {
        guard let path = Bundle.main.path(forResource: Constants.programsJSONFileName, ofType: Constants.JSON) else { return }
        do {
            let decoder = JSONDecoder()
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let programs = try decoder.decode([Program].self, from: data)
            completion(.success(programs))
            
        } catch {
            print(error)
        }
    }
}

extension ProgramClient {
    struct Constants {
        static let JSON = "json"
        static let programsJSONFileName = "trainer-programs"
    }
}

