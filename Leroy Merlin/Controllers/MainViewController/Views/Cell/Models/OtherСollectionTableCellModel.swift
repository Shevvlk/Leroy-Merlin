import UIKit

struct  Other–°ollectionTableCellModel: TableViewCellModel {
    
    let cellHeight: CGFloat = 280
    let heading: String
    let items: [Item]
    
    var cellType: (UITableViewCell & CellIdentifiable & ConfigurableWithAny).Type {
        return Other–°ollectionTableCell.self
    }
    
}
