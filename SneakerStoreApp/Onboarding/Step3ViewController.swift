import UIKit

// MARK: - Step3ViewController

class Step3ViewController: UIViewController {
    
    private let backgroundImage: UIImageView = {
        let image = UIImage(named: "step3")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    } ()
    
    private let nextButton = CustomButton()
    
    private let onboardingBottomSheet = OnboardingBottomSheetView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        setUI()
    }
    
    private func setUI() {
        [backgroundImage, onboardingBottomSheet].forEach { self.view.addSubview($0) }
        
        setConstraints()
        
        setButton()
    }
    
    private func setConstraints() {
        backgroundImage.fillView(self.view)
        self.view.sendSubviewToBack(backgroundImage)
        
        onboardingBottomSheet.anchor(right: self.view.rightAnchor, bottom: self.view.bottomAnchor, left: self.view.leftAnchor, height: 288)
    }
    
    private func setButton() {
        onboardingBottomSheet.delegate = self
        onboardingBottomSheet.buttonTitle = "Finish"
    }
}

// MARK: - OnboardingBottomSheetViewDelegate

extension Step3ViewController: OnboardingBottomSheetViewDelegate {
    func didButtonTap() {
        UIApplication.shared.windows.first?.rootViewController = TabBarViewController()
    }
}

