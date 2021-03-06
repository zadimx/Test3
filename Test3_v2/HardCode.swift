//
//  EnumHardCode.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 14.12.2021.
//

import UIKit
import Foundation

struct HardCode {
    let dateFormatterGet = DateFormatter()
    let dateFormatterPrint = DateFormatter()
    static let rowHeightCollectionView: CGFloat = 532
    static let rowHeightTableView: CGFloat = 132
    static let endpointUrlMainNews = "top-headlines?country=us&"
    static let endpointUrlOtherNews = "everything?q=bitcoin&"
    static let imageString = "11.png"
    static let firstUrlKeyString = "dda979c66ca84f9795d7856f49458efe"
    static let lastUrlKeyString = "e6ba851586f54334aa3967d780a4738d"

    static func urlApiNewsString(pageNews: Int, urlKey: String, pieceUrlNew: String) -> String {
        return "https://newsapi.org/v2/\(pieceUrlNew)pageSize=5&page=\(pageNews)&apiKey=\(urlKey)"
    }

    func dateFormat(dateString: String?) -> String {
        dateFormatterGetPrint()
        return dateFormatterPrint.string(from: dateFormatterGet.date(from: dateString!)!)
    }

    func dateFormatOtherNews(dateString: String?) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .short
        let time = Date(timeIntervalSince1970: TimeInterval(Date().timeIntervalSince1970))
        dateFormatterGetPrint()
        return formatter.localizedString(for: dateFormatterGet.date(from: dateString!)!, relativeTo: time)
    }

    func dateFormatterGetPrint() {
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        dateFormatterPrint.dateFormat = "MMM d,yyyy"
    }
}
