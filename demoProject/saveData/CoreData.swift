
import CoreData
import UIKit

class DataBaseSaving {
    
    var vc: ViewController?
    
    func save(name: String) {
        
        let app = (UIApplication.shared.delegate) as? AppDelegate
        let context = app?.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "StudentData", into: context!) as! Main
        entity.name = name
        
        do {
            try context?.save()
            print("Data has been saved")
            let result = try context?.fetch(Main.fetchRequest()) as? [Main]
            
            for item in result! {
                print(item.name!)
            }
        }
        catch {
            print("Error Occured During Save and Fetch ")
        }
    }
    
    func fetch() {
        let app = (UIApplication.shared.delegate) as? AppDelegate
        let context = app?.persistentContainer.viewContext
        
        do {
            try context?.save()
            print("Data has been fetch")
            let result = try context?.fetch(Main.fetchRequest()) as? [Main]
            
            for item in result! {
                print(item.name!)
            }
        }
        catch {
            print("Error Occured During Save and Fetch ")
        }
    }
    
    func clearData() {
        
        let app = (UIApplication.shared.delegate) as? AppDelegate
        let context = app?.persistentContainer.viewContext
        
        do {
            let items = try context?.fetch(Main.fetchRequest()) as! [Main]
            for item in items {
                context?.delete(item)
            }
            try context?.save()
            print("Data has been cleared successfully")
        }
        catch {
            print("Error Occured During Delete")
        }
        
    }
}

