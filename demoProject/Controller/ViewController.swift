//  ViewController.swift

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var networking = Networking()
    var saveDefaults = SaveDefaults()
    var nameCount: [String] = []
    var imageCount: [String] = []
    var indexCount = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        setSearchBar()
        networking.getData()
        fetchData()
        
    }
}

// MARK: SearchBarSearchButtonClicked
extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        let searchWord = self.searchBar.text
        if networking.name.contains(searchWord ?? "") {
            
            if let index = networking.name.firstIndex(of: searchWord ?? "") {
                self.indexCount = index
                self.nameCount.insert(searchWord ?? "", at: 0)
                self.imageCount.insert(self.networking.url[index], at: 0)
                
                tableView.reloadData()
            }
        }
        
        saveData()
        self.searchBar.placeholder = self.networking.name.randomElement()
        
        // MARK: AlertController
        if nameCount.contains(searchBar.text ?? "") == false {
            
            let alertController = UIAlertController(title: "404", message: "No Found", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Ok", style: .default) {_ in}
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
    }
}



