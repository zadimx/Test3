//
//  Table.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 10.11.2021.
//

import Foundation
import UIKit

class OtherNewsTableViewCell: UITableViewCell {
    @IBOutlet weak var otherNewsDateLabel: UILabel!
    @IBOutlet weak var otherNewsHistoryLabel: UILabel!
    @IBOutlet weak var otherNewsTopicTextView: UITextView!
    @IBOutlet weak var otherNewsImageNews: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        initialImageView(imageView: otherNewsImageNews)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setData(object: Article) {
        self.otherNewsDateLabel.text = HardCode().dateFormatOtherNews(dateString: object.publishedAt)
        HardCode().setupUrlImage(data: object, imageView: otherNewsImageNews)
        self.otherNewsHistoryLabel.text = object.source?.name
        self.otherNewsTopicTextView.text = object.title
    }
}

extension OtherNewsTableViewCell {
    func initialImageView(imageView: UIImageView) {
        imageView.layer.cornerRadius = 20
    }
}
