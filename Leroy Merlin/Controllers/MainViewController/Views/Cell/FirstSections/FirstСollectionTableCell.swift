
import UIKit

final class FirstСollectionTableCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    static let reuseId: String = "FirstСollectionTableCellReuseId"
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor =  .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private var items: [Item]?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(FirstCollectionCell.self, forCellWithReuseIdentifier: "cell")
        
        self.contentView.addSubview(collectionView)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        collectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! FirstCollectionCell
        
        cell.iconImageView.image = UIImage(named: items?[indexPath.row].image ?? "")
        cell.descriptionLabel.text = items?[indexPath.row].name
        
        if indexPath.row == 0 {
            cell.backgroundColor = #colorLiteral(red: 0.3254901961, green: 0.7387182522, blue: 0.2509803922, alpha: 1)
            cell.descriptionLabel.textColor = .white
            cell.iconImageView.image = UIImage(systemName: "list.dash")
            cell.tintColor = .white
        }
        
        return cell
    }
    
}

extension FirstСollectionTableCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height:  130)
    }
}


extension FirstСollectionTableCell: ConfigurableWithAny, CellIdentifiable  {
    
    func confugire(with object: Any) {
        
        let items = object as? FirstСollectionTableCellModel
        self.items = items?.items
        
    }
}

