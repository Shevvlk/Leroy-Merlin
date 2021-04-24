
import UIKit

final class TextFieldNavbar: UITextField {
    
    let searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "magnifyingglass")
        return imageView
    }()
    
    let searchView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 3
        view.backgroundColor = #colorLiteral(red: 0.3254901961, green: 0.7387182522, blue: 0.2509803922, alpha: 1)
        return view
    }()
    
    var padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 50)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        placeholder = "Поиск"
        layer.cornerRadius = 3
        clearButtonMode = .whileEditing
        leftViewMode = .whileEditing
        searchView.addSubview(searchImageView)
        rightView = searchView
        rightViewMode = .unlessEditing
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        if self.isEditing{
            padding.left = 30
        } else {
            padding.left = 10
        }
        return  bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        
        if self.isEditing{
            padding.left = 30
        } else {
            padding.left = 10
        }
        return  bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        
        if self.isEditing{
            padding.left = 30
        } else {
            padding.left = 10
        }
        return  bounds.inset(by: padding)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x:  self.frame.size.width - self.frame.size.height - 5,
                      y: self.frame.size.height/2 - (self.frame.size.height - 10)/2,
                      width: self.frame.size.height,
                      height: self.frame.size.height - 10)
    }
    
    private func setupConstraints () {
        searchImageView.heightAnchor.constraint(equalToConstant: 17).isActive = true
        searchImageView.widthAnchor.constraint(equalToConstant: 17).isActive = true
        searchImageView.centerYAnchor.constraint(equalTo: searchView.centerYAnchor).isActive = true
        searchImageView.centerXAnchor.constraint(equalTo: searchView.centerXAnchor).isActive = true
    }
    
}
