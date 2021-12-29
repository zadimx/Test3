//
// Created by Zinovatny Maksym on 29.12.2021.
//

import Foundation
import UIKit

struct RepetitiveCode {
    func setupUrlImage(data: Article, imageView: UIImageView) {
        if let urlString = data.urlToImage,
           let url = URL(string: urlString),
           let dataImage = try? Data(contentsOf: url) {
            imageView.image = UIImage(data: dataImage)
        } else {
            imageView.image = UIImage(named: HardCode.imageString)
        }
    }

    func setupData(object: Article, imageView: UIImageView, view: ContentView) {
        setupUrlImage(data: object, imageView: imageView)
        view.setupData(data: object)
    }

    public func layoutAttachAll(contentView: ContentView, view: UIView) {
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     contentView.topAnchor.constraint(equalTo: view.topAnchor)])
    }
}