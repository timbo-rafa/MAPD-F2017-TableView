
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let movies = ["Batman vs Superman", "Thor: Ragnorok", "Justice League", "Wonderwoman","Captain America: Civil War",  "Dark Tower", "Star Wars: The Last Jedi","Blade Runner 2049"]
    
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier)
        if(cell ==  nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: simpleTableIdentifier)
        }
        
        let image = UIImage(named: "star")
        cell?.imageView?.image = image
        let highlightedImage = UIImage(named: "star2")
        cell?.imageView?.highlightedImage = highlightedImage
        
        if indexPath.row < 5{
            cell?.detailTextLabel?.text = "Superhero Movies"
        } else {
            cell?.detailTextLabel?.text = "Sci-Fi Movies"
        }
        
        cell?.textLabel?.text = movies[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return indexPath.row % 4
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath.row == 0 ? nil : indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowValue = movies[indexPath.row]
        let message = "You selected \(rowValue)"
        
        let controller = UIAlertController(
            title: "Row Selected",
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "Yes I Did!",
            style: .default,
            handler: nil)
        
        controller.addAction(action);
        
        present(controller, animated: true, completion: nil)
        
    }
}

