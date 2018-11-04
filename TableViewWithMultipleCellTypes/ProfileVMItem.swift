//
//  ProfileVMItem.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Antonio Montes on 11/4/18.
//  Copyright © 2018 Stanislav Ostrovskiy. All rights reserved.
//

import Foundation

enum ProfileVMItemType {
    
    case mainInfo
    case about
    case email
    case attribute
    case friend
}

protocol ProfileVMItem {
    
    var type: ProfileVMItemType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
}

extension ProfileVMItem {
    var rowCount: Int { return 1 }
}

class ProfileVMMainInfoItem: ProfileVMItem {

    var type: ProfileVMItemType {
        return .mainInfo
    }

    var sectionTitle: String {
        return "Main Info"
    }

    var name: String?
    var pictureUrl: String?
    init(name: String, pictureUrl: String) {
        self.name = name
        self.pictureUrl = pictureUrl
    }
}

class ProfileVMAboutItem: ProfileVMItem {

    var type: ProfileVMItemType {
        return .about
    }

    var sectionTitle: String {
        return "About"
    }

    var about: String?
    init(about: String) {
        self.about = about
    }
}

class ProfileVMEmailItem: ProfileVMItem {

    var type: ProfileVMItemType {
        return .email
    }

    var sectionTitle: String {
        return "Email"
    }

    var email: String?
    init(email: String) {
        self.email = email
    }
}

class ProfileVMAttributeItem: ProfileVMItem {
    
    var type: ProfileVMItemType {
        return .attribute
    }

    var sectionTitle: String {
        return "Attributes"
    }

    var rowCount: Int {
        return attributes.count
    }

    var attributes: [Attribute]
    init(attributes: [Attribute]) {
        self.attributes = attributes
    }
}

class ProfileVMFriendsItem: ProfileVMItem {

    var type: ProfileVMItemType {
        return .friend
    }

    var sectionTitle: String {
        return "Friends"
    }

    var rowCount: Int {
        return friends.count
    }

    var friends: [Friend]
    init(friends: [Friend]) {
        self.friends = friends
    }
}
