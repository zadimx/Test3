//
//  DetailCollectionViewPresenter.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 17.11.2021.
//

import Foundation
import UIKit

protocol DetailNewsProtocol: class {
    func setupData(data: Article)
}

protocol DetailNewsPresenterProtocol: class {
    init(view: DetailNewsProtocol, router: RouterProtocol, data: Article)
    func setupData()
}

class DetailNewsPresenter: DetailNewsPresenterProtocol {
    weak var view: DetailNewsProtocol?
    var router: RouterProtocol
    let data: Article

    required init(view: DetailNewsProtocol, router: RouterProtocol, data: Article) {
        self.view = view
        self.router = router
        self.data = data
    }

    func setupData() {
        self.view?.setupData(data: data)
    }
}
