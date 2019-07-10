//
//  ProgramController.swift
//  Sweat
//
//  Created by Wael Saad - r00tdvd on 7/6/19.
//  Copyright © 2019 r00tdvd. All rights reserved.
//

import UIKit

class ProgramController: UIViewController {

    private var viewModel: ProgramViewModel = ProgramViewModel(client: ProgramClient())
    
    @IBOutlet private var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = Constants.defaultCellHeight
            tableView.register(forClass: ProgramTableViewCell.self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchPrograms() {  result in }
    }
}

extension ProgramController: UITableViewDataSource {
    
    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProgramTableViewCell = tableView.dequeueReusableCell(forClass: ProgramTableViewCell.self)
        cell.configure(with: viewModel.data[indexPath.item])
        return cell
    }
}

extension ProgramController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.defaultCellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - Constants

extension ProgramController {
    struct Constants {
        static let defaultCellHeight: CGFloat = 500
        static let estimatedHeaderRowHeight: CGFloat = 48.0
    }
}
