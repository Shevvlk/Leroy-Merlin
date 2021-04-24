
import UIKit

final class TabBarControllerAssembly {
    
    init() {}
    
    func createViewController() -> UITabBarController {
        
        let mainViewController = MainViewController()
        
        let magnifyingglassImage = UIImage(systemName: "magnifyingglass")
        let personImage = UIImage(systemName: "person")
        let cartImage = UIImage(systemName: "cart")
        let docImage = UIImage(systemName: "doc.plaintext")
        let shopImage = UIImage(systemName: "archivebox")
        
        
        let tabBarItems =  [UITabBarItem(title: "Мой Список", image: docImage, tag: 1),
                            UITabBarItem(title: "Магазины", image: shopImage, tag: 2),
                            UITabBarItem(title: "Профиль", image: personImage, tag: 3),
                            UITabBarItem(title: "Корзина", image: cartImage, tag: 4)]
        
        mainViewController.tabBarItem = UITabBarItem(title: "Главная", image: magnifyingglassImage, tag: 0)
        
        let tabBarController = UITabBarController()
        
        var tabBarList: [UIViewController] = [mainViewController]
        
        tabBarController.tabBar.tintColor = #colorLiteral(red: 0.3254901961, green: 0.7387182522, blue: 0.2509803922, alpha: 1)
        tabBarController.tabBar.barTintColor = .white
        tabBarController.tabBar.alpha = 1
        
        for tabBarItem in tabBarItems {
            let viewcontroller = UIViewController()
            viewcontroller.tabBarItem = tabBarItem
            viewcontroller.view.backgroundColor = .white
            tabBarList.append(viewcontroller)
        }
        
        tabBarController.viewControllers = tabBarList
        
        return tabBarController
    }
    
}
