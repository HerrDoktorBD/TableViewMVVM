//
//  AttributeCell.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Stanislav Ostrovskiy on 5/21/17.
//  Copyright © 2017 Stanislav Ostrovskiy. All rights reserved.
//

import UIKit

class AttributeCell: UITableViewCell {

    var item: Attribute?  {
        didSet {
            titleLabel.text = item?.key
            valueLabel.text = item?.value
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

        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)
    }
    
    func setupConstraints() {
        
        let marginGuide = contentView.layoutMarginsGuide

        titleLabel.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true

        // the next line will make cells self-sizing
        titleLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true

        valueLabel.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor).isActive = true
        valueLabel.leadingAnchor.constraint(lessThanOrEqualTo: titleLabel.trailingAnchor, constant: 8).isActive = true
        valueLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -20).isActive = true
    }

    let titleLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()

    let valueLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = NSTextAlignment.right
        return label
    }()

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
