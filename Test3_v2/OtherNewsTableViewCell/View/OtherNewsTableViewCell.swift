//
//  Table.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 10.11.2021.
//

import UIKit

class OtherNewsTableViewCell: UITableViewCell {

    @IBOutlet weak var pictureNewsImageView: UIImageView!
    var topicNameDateContentView: ContentView!
    @IBOutlet var emptyView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        topicNameDateContentView = (ContentView.loadViewFromNib() as! ContentView)
        let topicLabel = UIFont.preferredFont(forTextStyle: .callout)
        topicNameDateContentView.topicLabel.font = topicLabel
        RepetitiveCode().layoutAttachAll(contentView: topicNameDateContentView, view: emptyView)
        initialLayerImageView(imageView: pictureNewsImageView)
    }
}

extension OtherNewsTableViewCell {
    func initialLayerImageView(imageView: UIImageView) {
        imageView.layer.cornerRadius = 20
    }
}
