import UIKit

extension Int {
    fileprivate func stringPadded(to count: Int) -> String {
        var string = String(self)
        while string.count < count { string = "0" + string }
        return string
    }
}

class Model {
    static let shared = Model()
    private init() {}
    
    enum Animation: String, CaseIterable {
        case bureaucrat = "Talking Bureaucrat"
        case frog = "Talking Frog"
        case ranger = "Talking Ranger"
        case vendor = "Talking Vendor"
        case bot = "Talking Woodbot"
    }
    
    let cellCounts = [Animation.bureaucrat: 26, .frog: 62, .ranger: 86, .vendor: 36, .bot: 69]
    
    var characters: [Animation] {
        return Animation.allCases
    }
    
    func image(for character: String) -> UIImage? {
        let imageName = "\(character)000"
        guard let image = UIImage(named: imageName) else {fatalError("Image did not load. Model.image")}
        return image
    }
    
    func cells(for character: Animation) -> [UIImage] {
        let defaultValue = UIImage(named: "\(character.rawValue)000")
        var imageArray: [UIImage] = []
        print(cellCounts)
        guard let counts = cellCounts[character] else {fatalError("Could not get character. Model.cells")}
        for count in 0...counts {
            let imageName = "\(character.rawValue)\(count.stringPadded(to: 3))"
            imageArray.append(UIImage(named: imageName) ?? defaultValue!)
        }
        return imageArray
    }
    
    
}
