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
    @IBOutlet weak var newsDetailsDescriptionTextView: UITextView!
    @IBOutlet weak var newsDetailsImageView: UIImageView!
    @IBOutlet weak var viewContent: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        detailNewsPresenter.setupData()
        initialImageView(imageView: newsDetailsImageView, view: viewContent)
    }
}

extension DetailNewsViewController: DetailNewsProtocol {
    func setupData(data: Article) {
        HardCode().setupUrlImage(data: data, imageView: newsDetailsImageView)
        newsDetailsDateLabel.text = HardCode().dateFormat(dateString: data.publishedAt)
        newsDetailsHistoryLabel.text = data.source?.name
        newsDetailsTopicTextView.text = data.title
        newsDetailsDescriptionTextView.text = data.content
    }
}

extension DetailNewsViewController {
    func initialImageView(imageView: UIImageView, view: UIView) {
        imageView.layer.cornerRadius = 20
        view.layer.cornerRadius = 20
    }
}
