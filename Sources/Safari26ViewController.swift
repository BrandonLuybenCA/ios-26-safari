
import UIKit
import WebKit

class Safari26ViewController: UIViewController {
    
    private var currentWebView: WKWebView?
    private let addressBar = AdaptiveGlassAddressBar()
    private let toolbar = SafariToolbar()
    private let progressView = UIProgressView(progressViewStyle: .bar)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadTab(at: 0)
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        // Setup Progress View
        progressView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressView)
        
        // Setup Toolbar (Bottom)
        view.addSubview(toolbar)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        
        // Setup Address Bar (Floating bottom)
        view.addSubview(addressBar)
        addressBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            toolbar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            toolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolbar.heightAnchor.constraint(equalToConstant: 84),
            
            addressBar.bottomAnchor.constraint(equalTo: toolbar.topAnchor, constant: -8),
            addressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addressBar.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.94),
            addressBar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func loadTab(at index: Int) {
        currentWebView?.removeFromSuperview()
        
        let config = WKWebViewConfiguration()
        // Feature: Private Browsing Support
        // config.websiteDataStore = .nonPersistent() 
        
        let webView = TabManager.shared.createNewTab(configuration: config)
        currentWebView = webView
        view.insertSubview(webView, at: 0)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        if let url = URL(string: "https://www.google.com") {
            webView.load(URLRequest(url: url))
        }
    }
    
    // Feature: Reader Mode
    func toggleReaderMode() {
        let script = "document.querySelector('article').innerText" // Simplified
        currentWebView?.evaluateJavaScript(script) { result, error in
            // Present Reader UI
        }
    }
}
