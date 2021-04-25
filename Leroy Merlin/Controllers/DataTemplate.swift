
import UIKit

struct DataTemplate {

    func dataRequest() -> [Section]? {
        
        guard let url = Bundle.main.url(forResource: "DataTemplate.json", withExtension: nil) else {
            print("Error open file")
            return nil
        }
        guard let data = try? Data(contentsOf: url) else {
            print("Error Data(url)")
            return nil
        }
        let decoder = JSONDecoder()
        
        guard let result = try? decoder.decode([Section].self, from: data) else {
            print("Error decode")
            return nil
        }

        return result
    }
    
}



