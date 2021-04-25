
import UIKit

final class FirstCollectionCell: UICollectionViewCell {
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.9074891806, green: 0.9116891026, blue: 0.9219545722, alpha: 1)
        self.layer.cornerRadius = 5
        self.contentView.addSubview(descriptionLabel)
        self.contentView.addSubview(iconImageView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        descriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        
        iconImageView.heightAnchor.constraint(equalToConstant: self.contentView.frame.height/2).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: self.contentView.frame.width/2).isActive = true
        iconImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        iconImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
}



