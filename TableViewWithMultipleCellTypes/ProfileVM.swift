//
//  ProfileViewModel.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Stanislav Ostrovskiy on 4/25/17.
//  Copyright © 2017 Stanislav Ostrovskiy. All rights reserved.
//

import UIKit

class ProfileVM: NSObject {

    var items = [ProfileVMItem]()
    
    override init() {
        super.init()

        let bundle = Bundle(for: type(of: self))
        guard let data = dataFromFile("ServerData", bundle: bundle) else {
            return
        }

        guard let profile = Profile(data: data) else {
            return
        }

        items = profile.setupItems(fromProfile: profile)
    }
}

extension ProfileVM: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let item = items[indexPath.section]
        switch item.type {

            case .mainInfo:
                if let cell = tableView.dequeueReusableCell(withIdentifier: MainInfoCell.reuseIdentifier, for: indexPath) as? MainInfoCell {

                    cell.item = item
                    return cell
                }
            case .about:
                if let cell = tableView.dequeueReusableCell(withIdentifier: AboutCell.reuseIdentifier, for: indexPath) as? AboutCell {

                    cell.item = item
                    return cell
                }
            case .email:
                if let cell = tableView.dequeueReusableCell(withIdentifier: EmailCell.reuseIdentifier, for: indexPath) as? EmailCell {

                    cell.item = item
                    return cell
                }
            case .attribute:
                if let item = item as? ProfileVMAttributeItem,
                    let cell = tableView.dequeueReusableCell(withIdentifier: AttributeCell.reuseIdentifier, for: indexPath) as? AttributeCell {

                    let attribute = item.attributes[indexPath.row]
                    cell.item = attribute
                    return cell
                }
            case .friend:
                if let item = item as? ProfileVMFriendsItem,
                    let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.reuseIdentifier, for: indexPath) as? FriendCell {

                    let friend = item.friends[indexPath.row]
                    cell.item = friend
                    return cell
                }
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return items[section].sectionTitle
    }
}
