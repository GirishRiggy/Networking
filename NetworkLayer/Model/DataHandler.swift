//
//  DataHandler.swift
//  NetworkLayer
//
//  Created by iCode on 21/11/18.
//  Copyright © 2018 icode. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataHandler {
    
    let dataArray = ["user 1", "user 2", "user 3"]

    func insertData() {
        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext()!)!
        
        for value in dataArray {
            let user = NSManagedObject(entity: userEntity, insertInto: managedContext())
            user.setValue(value, forKey: "name")
        }
        
        do{
            try managedContext()?.save()
        }catch {
            print(Failure.DataBaseError)
        }
    }
    
    func fetchData() {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        //        fetchRequest.predicate = NSPredicate(format: "name = %@", "user 1")
        //        fetchRequest.fetchLimit = 2;
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "name", ascending: true)]
        
        do {
            let result = try managedContext()?.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
                print(data.value(forKey: "name") as! String)
            }
        }catch{
            print(Failure.DataBaseError)
        }
        
    }
    
    func updateData() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "name", ascending: false)]
        
        do {
            let result = try managedContext()?.fetch(fetchRequest)
            for data in result as! [User] {
                data.name = "Renamed \(data.name ?? "")"
            }
            
            do {
                try managedContext()?.save()
            }catch {
                print(Failure.DataBaseError)
            }
            
        } catch {
            print(Failure.DataBaseError)
        }
    }
    
    func deleteData() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.fetchLimit = 3
        
        do {
            let result = try managedContext()?.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                managedContext()?.delete(data)
            }
            
            do {
                try managedContext()?.save()
            } catch {
                print(Failure.DataBaseError)
            }
            
        }catch {
            print(Failure.DataBaseError)
        }
    }
    
    func managedContext() -> NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        return managedContext
    }
}
