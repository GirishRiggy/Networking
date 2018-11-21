//
//  ViewController.swift
//  NetworkLayer
//
//  Created by Girish K T on 14/11/18.
//  Copyright © 2018 icode. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let dataArray = ["user 1", "user 2", "user 3"]

    override func viewDidLoad() {
        super.viewDidLoad()

        insertData()
        updateData()
        fetchData()
        deleteData()
        fetchData()
    }
    
    func handleDataFromAPI() {
        
       let service = NetworkService()
    }

    func insertData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        
        for value in dataArray {
            let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
            user.setValue(value, forKey: "name")
        }
        
        do{
            try managedContext.save()
        }catch let error as NSError {
            print("Save Entity Failed : \(error)")
        }
    }
    
    func fetchData() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
//        fetchRequest.predicate = NSPredicate(format: "name = %@", "user 1")
//        fetchRequest.fetchLimit = 2;
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "name", ascending: true)]
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
                print(data.value(forKey: "name") as! String)
            }
        }catch{
            print("Error retrieving data")
        }
        
    }
    
    func updateData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "name", ascending: false)]
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [User] {
                data.name = "Renamed \(data.name ?? "")"
            }
            
            do {
                try managedContext.save()
            }catch {
                print("Error saving data")
            }
            
        } catch {
            print("DB Error")
        }
    }
    
    func deleteData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.fetchLimit = 3
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                managedContext.delete(data)
            }
            
            do {
                try managedContext.save()
            } catch {
                print("Error")
            }
            
        }catch {
            print("Error")
        }
    }
}

