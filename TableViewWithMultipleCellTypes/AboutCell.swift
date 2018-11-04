//
//  AboutCell.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Stanislav Ostrovskiy on 5/21/17.
//  Copyright © 2017 Stanislav Ostrovskiy. All rights reserved.
//

import UIKit

class AboutCell: UITableViewCell {

    var item: ProfileVMItem? {
        didSet {
            guard  let item = item as? ProfileVMAboutItem else {
                return
            }

            if let about = item.about {
                aboutLabel.text = about
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

        contentView.addSubview(aboutLabel)
    }
    
    func setupConstraints() {
        
        let marginGuide = contentView.layoutMarginsGuide

        aboutLabel.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor).isActive = true
        aboutLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 20).isActive = true
        aboutLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true

        // the next line will make cells self-sizing
        aboutLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
    }

    let aboutLabel: UILabel = {

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
