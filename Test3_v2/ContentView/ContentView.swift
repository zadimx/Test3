//
//  ContentView.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 28.12.2021.
//

import UIKit

class ContentView: UIView {
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var historyLabel: UILabel!

    func setupData(data: Article) {
        self.dateLabel.text = HardCode().dateFormatOtherNews(dateString: data.publishedAt)
        self.historyLabel.text = data.source?.name
        self.topicLabel.text = data.title
    }

    class func loadViewFromNib() -> UIView? {
        let bundle = Bundle.main
        let nib = UINib(nibName: "ContentView", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }


}
