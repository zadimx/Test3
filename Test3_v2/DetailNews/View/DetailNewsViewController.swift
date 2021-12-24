//
//  DetailCollectionView.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 17.11.2021.
//

import UIKit

class DetailNewsViewController: UIViewController {
    var presenter: DetailNewsPresenterProtocol!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var topicTextView: UITextView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var contentView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setupData()
        initialImageView(imageView: imageView, view: contentView)
    }
}

extension DetailNewsViewController: DetailNewsProtocol {
    func setupData(data: Article) {
        HardCode().setupUrlImage(data: data, imageView: imageView)
        dateLabel.text = HardCode().dateFormat(dateString: data.publishedAt)
        historyLabel.text = data.source?.name
        topicTextView.text = data.title
        descriptionTextView.text = data.content
    }
}

extension DetailNewsViewController {
    func initialImageView(imageView: UIImageView, view: UIView) {
        imageView.layer.cornerRadius = 20
        view.layer.cornerRadius = 20
    }
}
