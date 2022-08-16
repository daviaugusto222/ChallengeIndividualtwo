//
//  DatabaseManager.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 10/02/21.
//

import Foundation
import CoreData

enum StorageType {
    case persistent, inMemory
}

class DatabaseManager {
    
    public static let shared = DatabaseManager(.persistent)
    public static let inMemory = DatabaseManager(.inMemory)
    
    private var persistentContainer: NSPersistentContainer
    
    private static let modelName: String = "ChallengeIndividualtwo"
    
    private(set) lazy var managedContext: NSManagedObjectContext = {
        return self.persistentContainer.viewContext
    }()
    
    private init(_ storageType: StorageType = .persistent) {
        self.persistentContainer = NSPersistentContainer(name: DatabaseManager.modelName)
        
        if storageType == .inMemory {
            let description = NSPersistentStoreDescription()
            description.type = NSInMemoryStoreType
            self.persistentContainer.persistentStoreDescriptions = [description]
        }
        
        self.persistentContainer.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                print("CoreDataStack Error - Unresolved error \(error), \(error.userInfo)")
            }
        }
        
    }
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func getUser() -> User {
        let context = managedContext
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
        let context = managedContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Photo")
        request.returnsObjectsAsFaults = false
        var photos: [PhotoModel] = []
        do {
            let result = try context.fetch(request)
            guard let new = result as? [Photo] else {return photos}
            for photo in new {
                photos.append(PhotoModel(src: Src(large2X: photo.src!)))
            }
            
        } catch {
            print("Erro carregar fotos")
        }
        
        return photos
    }
    
    func fetchChallenges() -> [ChallengeModel] {
        let context = managedContext
        let request = NSFetchRequest<Challenge>(entityName: "Challenge")
        request.returnsObjectsAsFaults = false
        request.includesSubentities = true
        var challenges: [ChallengeModel] = []
        var photosChallenge: [PhotoChallengeModel] = []
        do {
            let result = try context.fetch(request)
            for challenge in result {
                photosChallenge = []
                if let photos = challenge.photos {
                    photos.forEach({ (foto) in
                        guard let photo = foto as? Photo else {return}
                        photosChallenge.append(PhotoChallengeModel(titlePhoto: photo.title ?? "", linkPhoto: URL(string: photo.src!)! ))
                    })
                }
                
                let newChallenge = ChallengeModel(title: challenge.title, photos: photosChallenge, photoArt: challenge.photoArt, favorited: challenge.favorited)
                challenges.append(newChallenge)
                
            }
            
        } catch {
            print("Erro carregar fotos")
        }
        return challenges
    }
    
    func saveFavorites(photos: [ChallengeCardCellViewModel]) {
        
        let context = managedContext
        var title = ""
        let newChallenge = Challenge(context: context)
        newChallenge.favorited = true
        
        for photo in photos {
            let newPhoto = Photo(context: context)
            newPhoto.src = photo.photoURL()?.absoluteString
            newPhoto.title = photo.titleLabel()
            //title.append(photo.titleLabel() + ".")
            
            newChallenge.addToPhotos(newPhoto)
        }
        
        let components = Calendar.current.dateComponents([.day, .month, .year], from: Date())
        let day = components.day ?? 0
        //let month = components.month ?? 0
        //        let year = components.year ?? 0
        //        let date = Calendar.current.date(from: components) ?? Date()
        title.append("\(day) de Fevereiro")
        newChallenge.title = title
        
        getUser().addToChallengers(newChallenge)
        
        saveContext()
    }
}
