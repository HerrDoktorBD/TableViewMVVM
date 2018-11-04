//
//  EmailCell.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Stanislav Ostrovskiy on 5/21/17.
//  Copyright © 2017 Stanislav Ostrovskiy. All rights reserved.
//

import UIKit

class EmailCell: UITableViewCell {

    var item: ProfileVMItem? {
        didSet {
            guard  let item = item as? ProfileVMEmailItem else {
                return
            }

            if let email = item.email {
                emailLabel.text = email
            }
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {

        contentView.addSubview(emailLabel)
    }

    func setupConstraints() {

        let marginGuide = contentView.layoutMarginsGuide

        emailLabel.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 20).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true

        // the next line will make cells self-sizing
        emailLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
    }

    let emailLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
