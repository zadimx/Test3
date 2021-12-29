//
//  Table.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 10.11.2021.
//

import UIKit

class OtherNewsTableViewCell: UITableViewCell {
    @IBOutlet weak var otherNewsImageNews: UIImageView!
    var topicNameDateContentView: ContentView!
    @IBOutlet var emptyView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        topicNameDateContentView = (ContentView.loadViewFromNib() as! ContentView)
        let topicLabel = UIFont.preferredFont(forTextStyle: .callout)
        topicNameDateContentView.topicLabel.font = topicLabel
        HardCode().layoutAttachAll(contentView: topicNameDateContentView, view: emptyView)
        HardCode().initialLayerImageView(imageView: otherNewsImageNews)
    }

}
