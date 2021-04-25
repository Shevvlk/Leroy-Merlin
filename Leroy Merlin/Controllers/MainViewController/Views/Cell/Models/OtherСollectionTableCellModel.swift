import UIKit

struct  OtherСollectionTableCellModel: TableViewCellModel {
    
    let cellHeight: CGFloat = 280
    let heading: String
    let items: [Item]
    
    var cellType: (UITableViewCell & CellIdentifiable & ConfigurableWithAny).Type {
        return OtherСollectionTableCell.self
    }
    
}
