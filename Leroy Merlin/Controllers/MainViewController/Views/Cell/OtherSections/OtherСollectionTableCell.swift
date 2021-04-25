
import UIKit

final class OtherСollectionTableCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    static let reuseId: String = "OtherСollectionTableCellReuseId"
    
    let headerName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor =  .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var items: [Item]?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(OtherCollectionCell.self, forCellWithReuseIdentifier: "cell")
        
        self.contentView.addSubview(        headerName)
        self.contentView.addSubview(collectionView)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        headerName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5).isActive = true
        headerName.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
        headerName.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        headerName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: self.headerName.bottomAnchor, constant: 10).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! OtherCollectionCell
        
        cell.nameLabel.text = items?[indexPath.row].name
        cell.priceLabel.text = items?[indexPath.row].price
        cell.iconImageView.image = UIImage(named: items?[indexPath.row].image ?? "")
        
        return cell
    }
    
}

extension OtherСollectionTableCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height:  205)
    }
    
}


extension OtherСollectionTableCell: ConfigurableWithAny, CellIdentifiable  {
    
    func confugire(with object: Any) {
        
        let items = object as? OtherСollectionTableCellModel
        
        headerName.text = items?.heading
        
        self.items = items?.models
        
    }
    
}

