//
//  MainInfoCell.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Stanislav Ostrovskiy on 5/21/17.
//  Copyright © 2017 Stanislav Ostrovskiy. All rights reserved.
//

import UIKit

class MainInfoCell: UITableViewCell {

    var item: ProfileVMItem? {
        didSet {
            guard let item = item as? ProfileVMMainInfoItem else {
                return
            }

            if let name = item.name {
                userName.text = name
            }

            if let pictureUrl = item.pictureUrl {
                userImage.image = UIImage(named: pictureUrl)
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
        
        contentView.addSubview(userImage)
        contentView.addSubview(userName)
    }
    
    func setupConstraints() {
        
        let marginGuide = contentView.layoutMarginsGuide

        userImage.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor).isActive = true
        userImage.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        userImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        userImage.heightAnchor.constraint(equalToConstant: 100).isActive = true

        // the next line will make cells self-sizing
        // userImage is the tallest element in the cell
        userImage.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true

        userName.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor).isActive = true
        userName.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        userName.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 20).isActive = true
        userName.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
    }

    let userImage: UIImageView = {

        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 50
        iv.clipsToBounds = true
        iv.backgroundColor = UIColor.lightGray
        return iv
    }()

    let userName: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = _ColorLiteralType(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()

    static var reuseIdentifier: String {
        return String(describing: self)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        userImage.image = nil
    }
}
