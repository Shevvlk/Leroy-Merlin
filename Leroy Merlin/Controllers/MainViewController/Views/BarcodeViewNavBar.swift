
import UIKit

final class BarcodeViewNavBar: UIView {
    
    let barcodeImageViewNavBar: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.image = UIImage(systemName: "barcode")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 4
        self.addSubview(barcodeImageViewNavBar)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        barcodeImageViewNavBar.widthAnchor.constraint(equalToConstant: 25).isActive = true
        barcodeImageViewNavBar.heightAnchor.constraint(equalToConstant: 25).isActive = true
        barcodeImageViewNavBar.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        barcodeImageViewNavBar.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

    }
    
}

