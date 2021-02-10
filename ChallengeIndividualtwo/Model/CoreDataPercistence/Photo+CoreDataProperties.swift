//
//  Photo+CoreDataProperties.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 10/02/21.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var src: String?
    @NSManaged public var photographer: String?
    @NSManaged public var avgColor: String?
    @NSManaged public var challenge: Challenge?

}

extension Photo : Identifiable {

}
