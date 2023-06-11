import UIKit

// MARK: - CustomImageView

class CustomImageView: UIImageView {
    
    public init() {
        super.init(frame: .zero)
        self.contentMode = .scaleToFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
