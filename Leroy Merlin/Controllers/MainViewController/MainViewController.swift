
import UIKit

final class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    let customNavigationBar: CustomNavigationBar = {
        let customNavigationBar = CustomNavigationBar()
        customNavigationBar.translatesAutoresizingMaskIntoConstraints = false
        return customNavigationBar
    }()
    
    let searchController = SearchResultsController()
    
    var heightAnchorNavigationBar: NSLayoutConstraint! = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        view.addSubview(customNavigationBar)
        
        customNavigationBar.controller = self
        customNavigationBar.searchController = searchController
        
        setupConstraint()
        
        tableView.register(СollectionTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.contentInset = UIEdgeInsets(top: 220 - tableView.safeAreaInsets.top, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -220)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! СollectionTableViewCell
        if indexPath.row == 0 {
            cell.descriptionLabel.text = nil
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let const = (scrollView.contentOffset.y + 100)/(-100)
        
        if scrollView.contentOffset.y >= -1000 && scrollView.contentOffset.y < -120{
            heightAnchorNavigationBar.constant = 220 - (scrollView.contentOffset.y + 220)
            customNavigationBar.setupAlpha(alpha: pow(const, 8))
            customNavigationBar.setupAlphaBackgroundView(alpha: 0)
        } else if scrollView.contentOffset.y > -120 {
            heightAnchorNavigationBar.constant = 120
            customNavigationBar.setupAlpha(alpha: 0)
            customNavigationBar.setupAlphaBackgroundView(alpha: 1)
        }
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if scrollView.contentOffset.y > -220 && scrollView.contentOffset.y < -150{
            heightAnchorNavigationBar.constant = 220
            animatecustomNavigationBar(constant: 220)
        } else if scrollView.contentOffset.y >= -150 && scrollView.contentOffset.y < -100{
            heightAnchorNavigationBar.constant = 120
            animatecustomNavigationBar(constant: 120)
        }
        
    }
    
    func animatecustomNavigationBar(constant: CGFloat ) {
        
        let alpha: CGFloat = constant != 220 ? 0 : 1
        
        UIView.animate(withDuration: 0.2) {
            self.customNavigationBar.setupAlpha(alpha: alpha)
            self.view.layoutIfNeeded()
            self.tableView.contentOffset = CGPoint(x: 0, y: -constant)
        } completion: { _ in
            self.customNavigationBar.setupAlphaBackgroundView(alpha: alpha == 0 ? 1 : 0)
        }
        
    }
    
    func setupConstraint() {
        
        customNavigationBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        customNavigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        customNavigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        heightAnchorNavigationBar = customNavigationBar.heightAnchor.constraint(equalToConstant: 220)
        heightAnchorNavigationBar?.isActive = true
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
    
    
}




