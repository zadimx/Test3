//
//  MyCollectionViewCell.swift
//  TestThree
//
//  Created by Zinovatny Maksym on 01.11.2021.
//

import UIKit

class MainNewsCollectionViewCell: UICollectionViewCell {
  var content: ContentView!
  @IBOutlet weak var topicNameDateView: UIView!
  @IBOutlet var mainNewsImageView: UIImageView!
    @IBOutlet weak var view: UIView!
    static let identifier = "MyCollectionViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "MainNewsCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        content = (ContentView.loadViewFromNib() as! ContentView)
      
        
        view.layer.cornerRadius = 20
        
        HardCode().layoutAttachAll(contentView: content, view: topicNameDateView)
        HardCode().initialLayerImageView(imageView: mainNewsImageView)
    }
}
