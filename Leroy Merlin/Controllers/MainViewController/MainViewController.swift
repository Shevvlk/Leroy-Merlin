
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
    let dataTemplate = DataTemplate().dataRequest()
    
    private var cellModels: [TableViewCellModel] = [] {
        willSet(newValue) {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        view.addSubview(customNavigationBar)
        
        customNavigationBar.controller = self
        customNavigationBar.searchController = searchController
        
        setupConstraint()
        
        cellModels = createCellModels()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.contentInset = UIEdgeInsets(top: 220 - tableView.safeAreaInsets.top, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -220)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellModel = cellModels[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.cellType.reuseId, for: indexPath)
        
        guard let configurableCell = cell as? (UITableViewCell & ConfigurableWithAny) else {
            return cell
        }
        
        configurableCell.confugire(with: cellModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellModels[indexPath.row].cellHeight
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let const = (scrollView.contentOffset.y + 100)/(-100)
        
        if scrollView.contentOffset.y >= -1000 && scrollView.contentOffset.y < -120{
            heightAnchorNavigationBar.constant = 220 - (scrollView.contentOffset.y + 220)
            customNavigationBar.setupAlpha(alpha: pow(const, 8))
            customNavigationBar.setupAlphaBackgroundView(alpha: 0)
        } else if scrollView.contentOffset.y >= -120 {
            heightAnchorNavigationBar.constant = 120
            customNavigationBar.setupAlpha(alpha: 0)
            customNavigationBar.setupAlphaBackgroundView(alpha: 1)
        }
        
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                               withVelocity velocity: CGPoint,
                               targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        if velocity.y == 0 {
            if scrollView.contentOffset.y > -220 && scrollView.contentOffset.y < -150{
                targetContentOffset.pointee = CGPoint(x: 0, y: -220)
            } else if scrollView.contentOffset.y >= -150 && scrollView.contentOffset.y < -100{
                targetContentOffset.pointee = CGPoint(x: 0, y: -120)
            }
        }
        
    }

    private func createCellModels() -> [TableViewCellModel] {
        
        guard let dataTemplate  = dataTemplate else {
            return []
        }
        
        let firstSection = FirstСollectionTableCellModel(items: dataTemplate[0].items)
        let secondSection = OtherСollectionTableCellModel(heading: dataTemplate[1].heading, items: dataTemplate[1].items)
        let thirdSection = OtherСollectionTableCellModel(heading: dataTemplate[2].heading, items: dataTemplate[2].items)
        
        let cellModel: [TableViewCellModel] = [firstSection,secondSection,thirdSection]
        
        cellModel.forEach({ model in
            tableView.register(model.cellType, forCellReuseIdentifier: model.cellType.reuseId)
        })
        
        return cellModel
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




