//
//  Table.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 10.11.2021.
//

import UIKit

class OtherNewsTableViewCell: UITableViewCell {
    @IBOutlet weak var otherNewsImageNews: UIImageView!

  var content: ContentView!
  @IBOutlet var topicNameDateView: UIView!
  override func awakeFromNib() {
        super.awakeFromNib()
    content = (ContentView.loadViewFromNib() as! ContentView)
    let topicLabel = UIFont.preferredFont(forTextStyle: .callout)
    content.topicLabel.font = topicLabel
    HardCode().layoutAttachAll(contentView: content, view: topicNameDateView)
    
    HardCode().initialLayerImageView(imageView: otherNewsImageNews)
    }
  
}
