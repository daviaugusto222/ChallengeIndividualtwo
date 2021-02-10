//
//  DatabaseManager.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 10/02/21.
//

import Foundation
import CoreData

class DatabaseManager {
    
    // MARK: - Core Data stack
    
    static var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "ChallengeIndividualtwo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext() {
        let context = DatabaseManager.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func getUser() -> User {
        let context = DatabaseManager.persistentContainer.viewContext
        var setUser = [User]()
        do {
            setUser = try (context.fetch(User.fetchRequest()) as? [User])!
        } catch {
            print("Deu erro no user: \(error)")
        }
        
        if setUser.isEmpty {
            let user = User(context: context)
            saveContext()
            return user
        } else {
            return setUser.first!
        }
    }
    
    func fetchPhotos() -> [PhotoModel] {
        let context = DatabaseManager.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Photo")
        request.returnsObjectsAsFaults = false
        var photos: [PhotoModel] = []
        do {
            let result = try context.fetch(request)
            let new = result as! [Photo]
            for photo in new {
                photos.append(PhotoModel(photographer: photo.photographer!, avgColor: photo.avgColor!, src: Src(large2X: photo.src!)))
            }
            
        }catch {
            print("Erro carregar fotos")
        }
        
        return photos
    }
}
