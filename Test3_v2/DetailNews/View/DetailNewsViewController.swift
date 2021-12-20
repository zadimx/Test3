//
//  DetailCollectionView.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 17.11.2021.
//

import UIKit

class DetailNewsViewController: UIViewController {
  var detailNewsPresenter: DetailNewsPresenterProtocol!
  @IBOutlet weak var newsDetailsDateLabel: UILabel!
  @IBOutlet weak var newsDetailsHistoryLabel: UILabel!
  @IBOutlet weak var newsDetailsTopicTextView: UITextView!
  @IBOutlet weak var newsDetailsDesriptionTextView: UITextView!
  @IBOutlet weak var newsDetailsImageView: UIImageView!
  @IBOutlet weak var viewContent: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    detailNewsPresenter.setData()
    initialImageView(imageView: newsDetailsImageView, view: viewContent)
  }
}

extension DetailNewsViewController: DetailNewsProtocol{
  func setData(dataArticles: Articles) {
    if (dataArticles.urlToImage?.isEmpty == true || dataArticles.urlToImage == nil) {
      newsDetailsImageView.image = UIImage(named: HardCode.imageString)
    } else{
      let url = URL(string: dataArticles.urlToImage!)
      if let dataImage = try? Data(contentsOf: url!){
        newsDetailsImageView.image = UIImage(data: dataImage)
      }
    }
    newsDetailsDateLabel.text = HardCode().dateFormart(dateString: dataArticles.publishedAt)
    newsDetailsHistoryLabel.text = dataArticles.source?.name
    newsDetailsTopicTextView.text = dataArticles.title
    newsDetailsDesriptionTextView.text = dataArticles.content
  }
}

extension DetailNewsViewController{
  func initialImageView(imageView: UIImageView, view: UIView){
    imageView.layer.cornerRadius = 20
    view.layer.cornerRadius = 20
  }
}
