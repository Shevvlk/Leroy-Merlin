
import UIKit

final class CustomNavigationBar: UIView, UITextFieldDelegate {
    
    var bottomAnchortTextField: NSLayoutConstraint! = nil
    var trailingAnchorTextField: NSLayoutConstraint! = nil
    
    var searchController: UITableViewController? = nil
    
    weak var controller: UIViewController?
    
    var alphaOld: CGFloat?
    
    
    let cancelButtonNavBar: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        return button
    }()
    
    lazy var backgroundViewNavBar: UIView = {
        let view = UIView()
        view.alpha = 0
        view.backgroundColor = .white
        view.layer.shadowRadius = 8
        view.layer.shadowOpacity = 0.7
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var textFieldNavbar: TextFieldNavbar = {
        let textField = TextFieldNavbar()
        textField.leftView = cancelButtonNavBar
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let labelNavBar: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Поиск товаров"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let barcodeViewNavBar: BarcodeViewNavBar = {
        let view = BarcodeViewNavBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(backgroundViewNavBar)
        self.addSubview(labelNavBar)
        self.addSubview(barcodeViewNavBar)
        self.addSubview(textFieldNavbar)
        self.backgroundColor = #colorLiteral(red: 0.3254901961, green: 0.7387182522, blue: 0.2509803922, alpha: 1)
        
        cancelButtonNavBar.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        bottomAnchortTextField.constant =  -110 + (200 - self.frame.height)
        trailingAnchorTextField.constant = -15
        addingSearchController()
        
        if self.frame.height == 120 {
            
            UIView.animate(withDuration: 0.3) {
                self.layoutIfNeeded()
            }
            
        } else {
            
            self.textFieldNavbar.searchView.isHidden = true
            
            UIView.animate(withDuration: 0.3) {
                self.setupAlpha(alpha: 0)
                self.layoutIfNeeded()
            } completion: { _ in
                self.setupAlphaBackgroundView(alpha: 1)
            }
            
        }
    }
    
    
    func setupAlpha (alpha: CGFloat) {
        self.backgroundColor = #colorLiteral(red: 0.3254901961, green: 0.7387182522, blue: 0.2509803922, alpha: 1).withAlphaComponent(alpha)
        self.barcodeViewNavBar.alpha = alpha
        self.textFieldNavbar.searchView.alpha = alpha
        self.labelNavBar.alpha = alpha
    }
    
    func setupAlphaBackgroundView  (alpha: CGFloat) {
        backgroundViewNavBar.alpha = alpha
    }
    
    func addingSearchController() {
        if let searchController = searchController, let controller = controller {
            controller.addChild(searchController)
            searchController.view.frame = CGRect(x: 0, y: 90, width:  controller.view.frame.width, height: controller.view.frame.height)
            controller.view.insertSubview(searchController.tableView, at: 1)
            searchController.didMove(toParent: controller )
            searchController.tableView.alpha = 1
        }
    }
    
    //    func removeSearchController() {
    //        if let searchController = searchController, let controller = controller {
    //            controller.willMove(toParent: nil)
    //            controller.view.willRemoveSubview(searchController.tableView)
    //            controller.removeFromParent()
    //        }
    //    }
    
    @objc  func cancel() {
        
        textFieldNavbar.resignFirstResponder()
        textFieldNavbar.text = ""
        bottomAnchortTextField.constant = -30
        trailingAnchorTextField.constant = -75
        searchController?.tableView.alpha = 0
        
        if self.frame.height != 120 {
            
            setupAlphaBackgroundView(alpha: 0)
            
            UIView.animate(withDuration: 0.3) {
                self.setupAlpha(alpha: 1)
                self.layoutIfNeeded()
            } completion: { _ in
                self.textFieldNavbar.searchView.isHidden = false
            }
            
        } else {
            
            UIView.animate(withDuration: 0.3) {
                self.layoutIfNeeded()
            }
            
        }
        
    }
    
    func setupConstraint() {
        
        textFieldNavbar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bottomAnchortTextField = textFieldNavbar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30)
        bottomAnchortTextField?.isActive = true
        textFieldNavbar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        trailingAnchorTextField = textFieldNavbar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80)
        trailingAnchorTextField?.isActive = true
        
        labelNavBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        labelNavBar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -90).isActive = true
        labelNavBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        labelNavBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        
        barcodeViewNavBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        barcodeViewNavBar.widthAnchor.constraint(equalToConstant: 50).isActive = true
        barcodeViewNavBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        barcodeViewNavBar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:  -30).isActive = true
        
        backgroundViewNavBar.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backgroundViewNavBar.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backgroundViewNavBar.heightAnchor.constraint(equalToConstant: 95).isActive = true
        backgroundViewNavBar.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
    }
    
}
