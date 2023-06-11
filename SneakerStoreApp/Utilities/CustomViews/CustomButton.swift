import UIKit

// MARK: - CustomButtonTypes

enum CustomButtonTypes {
    case addToCart
    case addOrRemoveQuantity
}

// MARK: - CustomButton

class CustomButton: UIButton {
    
    public var title: String? {
        didSet {
            self.setTitle(title, for: .normal)
        }
    }
    
    public var customButtonType: CustomButtonTypes?
    
    public init(type: CustomButtonTypes? = nil) {
        self.customButtonType = type
        super.init(frame: .zero)
        
        self.backgroundColor = .black
        self.layer.cornerRadius = 12
        
        self.titleLabel?.textColor = .white
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        self.titleLabel?.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
