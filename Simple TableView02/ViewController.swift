import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var selection = 0
    
    var animals = ["Bird", "Cat", "Pig", "Horse", "Whale"]
    var ages = ["1 세", "2 세", "3 세", "4 세", "5 세"]
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Animal Farm 1"
        } else {
            return "Animal Farm 2"
        }
    }
    
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "End Of Animal Farm 1"
        } else {
            return "End Of Animal Farm 2"
        }
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "Re", for: indexPath)
        let row = indexPath.row
        
        cell.textLabel?.text = animals[row]
        cell.detailTextLabel?.text = ages[row]
        cell.imageView?.image = UIImage(named: animals[row])
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToAdd" {
            let addVC = segue.destination as! AddViewController
            
            addVC.cellTitle = String(animals[selection])
            addVC.cellImage = UIImage(named: animals[selection])
        } else if segue.identifier == "GoToDetail" {
            let detailVC = segue.destination as! DetailViewController
            
            detailVC.cellTitle = String(animals[selection])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
    }
}
