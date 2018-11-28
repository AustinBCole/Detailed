import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var character: Model.Animation?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let character = character else {fatalError("Could not load character. DetailViewController.viewWillAppear")}
        
        let count = Model.shared.cellCounts[character]! / 15
        
        label.text = character.rawValue
        
        let cells = Model.shared.cells(for: character)
        imageView.animationImages = cells
        imageView.animationRepeatCount = 0
        imageView.animationDuration = TimeInterval(count)
        imageView.startAnimating()
    }
    
}
