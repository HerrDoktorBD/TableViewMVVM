//
//  ProfileModel.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Stanislav Ostrovskiy on 4/25/17.
//  Copyright © 2017 Stanislav Ostrovskiy. All rights reserved.
//

import Foundation

typealias JSONDict = [String: Any]

public func dataFromFile(_ filename: String, bundle: Bundle) -> Data? {

    guard let path = bundle.path(forResource: filename, ofType: "json") else {
        return nil
    }
    return (try? Data(contentsOf: URL(fileURLWithPath: path)))
}

class Profile {

    var fullName: String?
    var pictureUrl: String?
    var email: String?
    var about: String?
    var friends = [Friend]()
    var attributes = [Attribute]()

    init?(data: Data) {
        do {
            if let json = try JSONSerialization.jsonObject(with: data) as? JSONDict, let body = json["data"] as? JSONDict {

                self.fullName = body["fullName"] as? String
                self.pictureUrl = body["pictureUrl"] as? String
                self.about = body["about"] as? String
                self.email = body["email"] as? String

                if let friends = body["friends"] as? [JSONDict] {
                    self.friends = friends.map { Friend(json: $0) }
                }

                if let attributes = body["profileAttributes"] as? [JSONDict] {
                    self.attributes = attributes.map { Attribute(json: $0) }
                }
            }
        } catch {
            print("Error deserializing JSON: \(error)")
            return nil
        }
    }

    func setupItems(fromProfile profile: Profile) -> [ProfileVMItem] {

        var items = [ProfileVMItem]()

        if let name = profile.fullName, let pictureUrl = profile.pictureUrl {
            let mainInfoItem = ProfileVMMainInfoItem(name: name, pictureUrl: pictureUrl)
            items.append(mainInfoItem)
        }

        if let about = profile.about {
            let aboutItem = ProfileVMAboutItem(about: about)
            items.append(aboutItem)
        }

        if let email = profile.email {
            let emailItem = ProfileVMEmailItem(email: email)
            items.append(emailItem)
        }

        let attributes = profile.attributes
        if !attributes.isEmpty {
            let attributesItem = ProfileVMAttributeItem(attributes: attributes)
            items.append(attributesItem)
        }

        let friends = profile.friends
        if !profile.friends.isEmpty {
            let friendsItem = ProfileVMFriendsItem(friends: friends)
            items.append(friendsItem)
        }

        return items
    }
}

class Friend {
    var name: String?
    var pictureUrl: String?

    init(json: JSONDict) {
        self.name = json["name"] as? String
        self.pictureUrl = json["pictureUrl"] as? String
    }
}

class Attribute {
    var key: String?
    var value: String?

    init(json: JSONDict) {
        self.key = json["key"] as? String
        self.value = json["value"] as? String
    }
}
