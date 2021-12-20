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
  
  func setData(object: Articles) {
    self.otherNewsDateLabel.text = HardCode().dateFormartOtherNews(dateString: object.publishedAt)
    if (object.urlToImage?.isEmpty == true || object.urlToImage == nil) {
      self.otherNewsImageNews.image = UIImage(named: HardCode.imageString)
    } else {
      let url = URL(string: object.urlToImage!)
      if let dataImage = try? Data(contentsOf: url!) {
        self.otherNewsImageNews.image = UIImage(data: dataImage)
      }
    }
    self.otherNewsHistoryLabel.text = object.source?.name
    self.otherNewsTopicTextView.text = object.title
  }
}

extension OtherNewsTableViewCell {
  func initialImageView(imageView: UIImageView) {
    imageView.layer.cornerRadius = 20
  }
}
