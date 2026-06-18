import UIKit

class AdaptiveGlassAddressBar: UIView {
    private let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
    private let urlLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupUI() {
        layer.cornerRadius = 30
        layer.masksToBounds = true
        
        addSubview(blurEffectView)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        urlLabel.text = "apple.com"
        urlLabel.font = .systemFont(ofSize: 16, weight: .medium)
        urlLabel.textColor = .label
        urlLabel.textAlignment = .center
        
        addSubview(urlLabel)
        urlLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            urlLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            urlLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
