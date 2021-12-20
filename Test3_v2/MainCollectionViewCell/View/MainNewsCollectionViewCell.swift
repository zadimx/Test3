//
//  MyCollectionViewCell.swift
//  TestThree
//
//  Created by Zinovatny Maksym on 01.11.2021.
//

import UIKit

class MainNewsCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet var mainNewsDateLabel: UILabel!
  @IBOutlet var mainNewsHistoryLabel: UILabel!
  @IBOutlet var mainNewsTopicTextView: UITextView!
  @IBOutlet var mainNewsImageView: UIImageView!
  @IBOutlet weak var mainNewsContentView: UIView!
  static let identifier = "MyCollectionViewCell"
  
  static func nib() -> UINib {
    return UINib(nibName: "MainNewsCollectionViewCell", bundle: nil)
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    mainNewsContentView.layer.cornerRadius = 20
    initialImageView(imageView: mainNewsImageView)
  }
  
  public func setData(with mainObject: Articles) {
    mainNewsDateLabel.text = HardCode().dateFormart(dateString: mainObject.publishedAt)
    mainNewsHistoryLabel.text = mainObject.source?.name
    mainNewsTopicTextView.text = mainObject.title
    if (mainObject.urlToImage?.isEmpty == true || mainObject.urlToImage == nil) {
      mainNewsImageView.image = UIImage(named: HardCode.imageString)
    } else {
      if let url = URL(string: mainObject.urlToImage!) {
        if let dataImage = try? Data(contentsOf: url) {
          mainNewsImageView.image = UIImage(data: dataImage)
        }
      }
    }
  }
}

extension MainNewsCollectionViewCell {
  func initialImageView(imageView: UIImageView) {
    imageView.layer.cornerRadius = 20
  }
}
