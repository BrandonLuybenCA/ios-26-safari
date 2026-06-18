
import Foundation
import WebKit

class SafariFeaturesManager {
    static let shared = SafariFeaturesManager()
    
    // Feature: Bookmarks
    var bookmarks: [Bookmark] = []
    
    // Feature: History
    var history: [HistoryItem] = []
    
    func addBookmark(title: String, url: URL) {
        bookmarks.append(Bookmark(title: title, url: url))
    }
    
    func addToHistory(title: String, url: URL) {
        history.append(HistoryItem(title: title, url: url, date: Date()))
    }
    
    // Feature: Private Browsing Mode
    func getPrivateConfiguration() -> WKWebViewConfiguration {
        let config = WKWebViewConfiguration()
        config.websiteDataStore = WKWebsiteDataStore.nonPersistent()
        return config
    }
}

struct Bookmark: Codable {
    let title: String
    let url: URL
}

struct HistoryItem: Codable {
    let title: String
    let url: URL
    let date: Date
}
