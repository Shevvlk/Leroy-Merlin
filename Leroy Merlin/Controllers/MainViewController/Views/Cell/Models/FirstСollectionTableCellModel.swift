
import UIKit

struct  First–°ollectionTableCellModel: TableViewCellModel {
    
    let cellHeight: CGFloat = 200
    let items: [Item]
    
    var cellType: (UITableViewCell & CellIdentifiable & ConfigurableWithAny).Type {
        return First–°ollectionTableCell.self
    }
    
}
