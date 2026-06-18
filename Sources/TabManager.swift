
import UIKit
import WebKit

class TabManager {
    static let shared = TabManager()
    var tabs: [WKWebView] = []
    var currentIndex: Int = 0
    
    func createNewTab(configuration: WKWebViewConfiguration) -> WKWebView {
        let webView = WKWebView(frame: .zero, configuration: configuration)
        tabs.append(webView)
        currentIndex = tabs.count - 1
        return webView
    }
    
    func closeTab(at index: Int) {
        guard index < tabs.count else { return }
        tabs.remove(at: index)
        if currentIndex >= tabs.count {
            currentIndex = max(0, tabs.count - 1)
        }
    }
}
