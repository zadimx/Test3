//
//  DetailCollectionView.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 17.11.2021.
//

import UIKit

class DetailNewsViewController: UIViewController {
    var topicNameDateContentView: ContentView!
    var presenter: DetailNewsPresenterProtocol!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var emptyView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        topicNameDateContentView = (ContentView.loadViewFromNib() as! ContentView)
        presenter.setupData()
        initialImageView(imageView: imageView, view: contentView)
        HardCode().layoutAttachAll(contentView: topicNameDateContentView, view: emptyView)
    }
}

extension DetailNewsViewController: DetailNewsProtocol {
    func setupData(data: Article) {
        HardCode().setupData(object: data, imageView: imageView, view: topicNameDateContentView)
        descriptionTextView.text = data.content
    }

}

extension DetailNewsViewController {
    func initialImageView(imageView: UIImageView, view: UIView) {
        imageView.layer.cornerRadius = 20
        view.layer.cornerRadius = 20
    }
}
