import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelTable: UILabel!
    @IBOutlet weak var imageTable: LazyImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.labelTable.text = ""
    }
}
