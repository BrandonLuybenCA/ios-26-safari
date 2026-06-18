
import UIKit

class SafariToolbar: UIToolbar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupItems()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func setupItems() {
        let back = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: nil, action: nil)
        let forward = UIBarButtonItem(image: UIImage(systemName: "chevron.forward"), style: .plain, target: nil, action: nil)
        let share = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: nil, action: nil)
        let bookmarks = UIBarButtonItem(image: UIImage(systemName: "book"), style: .plain, target: nil, action: nil)
        let tabs = UIBarButtonItem(image: UIImage(systemName: "square.on.square"), style: .plain, target: nil, action: nil)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        self.setItems([back, spacer, forward, spacer, share, spacer, bookmarks, spacer, tabs], animated: false)
    }
}
