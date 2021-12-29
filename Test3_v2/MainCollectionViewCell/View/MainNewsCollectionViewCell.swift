//
//  MyCollectionViewCell.swift
//  TestThree
//
//  Created by Zinovatny Maksym on 01.11.2021.
//

import UIKit

class MainNewsCollectionViewCell: UICollectionViewCell {
    var topicNameDateContentView: ContentView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var view: UIView!
    static let identifier = "MyCollectionViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "MainNewsCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        topicNameDateContentView = (ContentView.loadViewFromNib() as! ContentView)
        view.layer.cornerRadius = 20
        HardCode().layoutAttachAll(contentView: topicNameDateContentView, view: emptyView)
        HardCode().initialLayerImageView(imageView: imageView)
    }
}
