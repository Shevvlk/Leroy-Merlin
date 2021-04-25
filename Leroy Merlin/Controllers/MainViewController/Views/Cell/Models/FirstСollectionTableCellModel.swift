
import UIKit

struct  FirstСollectionTableCellModel: TableViewCellModel {
    
    let cellHeight: CGFloat = 200
    let models: [Item]
    
    var cellType: (UITableViewCell & CellIdentifiable & ConfigurableWithAny).Type {
        return FirstСollectionTableCell.self
    }
    
}
