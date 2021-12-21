import Foundation

struct Root: Decodable {
    var articles: [Article]
}

struct Article: Decodable {
    var source: Source?
    var title: String?
    var content: String?
    var urlToImage: String?
    var url: String?
    var publishedAt: String?
}

struct Source: Decodable {
    var name: String?
}

