import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var cellTitle: String?
    var cellImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleText.text = cellTitle
        imageView.image = cellImage
    }
}
