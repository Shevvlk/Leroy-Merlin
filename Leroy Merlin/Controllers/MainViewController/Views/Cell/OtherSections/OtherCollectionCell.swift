
import UIKit

final class OtherCollectionCell: UICollectionViewCell {
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(iconImageView)
        self.contentView.addSubview(priceLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        iconImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        iconImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        iconImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        priceLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 3).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 3).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
}



