
import UIKit

extension ViewController {
    
    // MARK: Functions
    func setSearchBar() {
        self.searchBar.delegate = self
        
        // searchBarPlaceholder
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1200)) {
            self.searchBar.placeholder = self.networking.name.randomElement()
        }
    }
    
    func setTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func fetchData() {
        self.nameCount = self.saveDefaults.save.stringArray(forKey: "3") ?? []
        self.imageCount = self.saveDefaults.save.stringArray(forKey: "4") ?? []
    }
    
    func saveData() {
        self.saveDefaults.save.setValue(self.nameCount, forKey: "3")
        self.saveDefaults.save.setValue(self.imageCount, forKey: "4")
    }
}

