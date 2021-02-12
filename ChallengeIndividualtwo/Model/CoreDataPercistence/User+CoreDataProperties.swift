//
//  User+CoreDataProperties.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 10/02/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var challengers: NSSet?

}

// MARK: Generated accessors for challengers
extension User {

    @objc(addChallengersObject:)
    @NSManaged public func addToChallengers(_ value: Challenge)

    @objc(removeChallengersObject:)
    @NSManaged public func removeFromChallengers(_ value: Challenge)

    @objc(addChallengers:)
    @NSManaged public func addToChallengers(_ values: NSSet)

    @objc(removeChallengers:)
    @NSManaged public func removeFromChallengers(_ values: NSSet)

}

extension User : Identifiable {

}
