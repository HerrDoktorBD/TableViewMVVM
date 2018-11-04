//
//  ViewController.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Stanislav Ostrovskiy on 4/25/17.
//  Copyright © 2017 Stanislav Ostrovskiy. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    fileprivate let vm = ProfileVM()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "MultipleCellTypes"
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView?.dataSource = vm

        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableView.automaticDimension

        tableView?.register(MainInfoCell.self, forCellReuseIdentifier: MainInfoCell.reuseIdentifier)
        tableView?.register(AboutCell.self, forCellReuseIdentifier: AboutCell.reuseIdentifier)
        tableView?.register(EmailCell.self, forCellReuseIdentifier: EmailCell.reuseIdentifier)
        tableView?.register(AttributeCell.self, forCellReuseIdentifier: AttributeCell.reuseIdentifier)
        tableView?.register(FriendCell.self, forCellReuseIdentifier: FriendCell.reuseIdentifier)
    }
}
