//
//  Challenge+CoreDataProperties.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 10/02/21.
//
//

import Foundation
import CoreData


extension Challenge {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Challenge> {
        return NSFetchRequest<Challenge>(entityName: "Challenge")
    }

    @NSManaged public var title: String?
    @NSManaged public var photos: NSSet?
    @NSManaged public var user: User?

}

// MARK: Generated accessors for photos
extension Challenge {

    @objc(addPhotosObject:)
    @NSManaged public func addToPhotos(_ value: Photo)

    @objc(removePhotosObject:)
    @NSManaged public func removeFromPhotos(_ value: Photo)

    @objc(addPhotos:)
    @NSManaged public func addToPhotos(_ values: NSSet)

    @objc(removePhotos:)
    @NSManaged public func removeFromPhotos(_ values: NSSet)

}

extension Challenge : Identifiable {

}
