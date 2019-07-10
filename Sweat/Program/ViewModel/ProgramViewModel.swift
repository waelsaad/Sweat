//
//  ProgramViewModel.swift
//  Sweat
//
//  Created by Wael Saad - r00tdvd on 7/6/19.
//  Copyright © 2019 r00tdvd. All rights reserved.
//

import Foundation

protocol ProgramViewModelType {
    var title: String { get }
    var data: [Program] { get }
    
    func fetchPrograms(completion: @escaping (Result<[Program], Error>) -> Void)
}

class ProgramViewModel: ProgramViewModelType {
    
    var title: String {
        return "PROGRAM.TITLE".localized
    }
  
    var data: [Program] {
        return allData
    }

    init(client: ProgramClient) {
        self.client = client
    }

    func fetchPrograms(completion: @escaping (Result<[Program], Error>) -> Void) {
        client.fetchPrograms() {  result in
            switch result {
            case let .success(response):
                self.allData = response
                //print (response)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    // Private
    private var client: ProgramClient
    private var allData: [Program] = []
}
