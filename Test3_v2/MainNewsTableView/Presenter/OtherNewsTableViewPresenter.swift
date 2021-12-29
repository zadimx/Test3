//
//  File.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 09.11.2021.
//

import Foundation
import UIKit

protocol OtherNewsTableViewProtocol: class {
    func success()
    func failure(error: Error)
}

protocol OtherNewsTableViewPresenterProtocol: class {
    var arrayArticles: [Article] { get set }
    var router: RouterProtocol { get }

    init(view: OtherNewsTableViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, endpoint: String)
    func getArticles()
    func tabOnTheArticles(article: Article)
}

class OtherNewsTableViewPresenter: OtherNewsTableViewPresenterProtocol {
    var arrayArticles: [Article] = []
    var pageNews = 1
    weak var view: OtherNewsTableViewProtocol?
    var router: RouterProtocol
    let networkService: NetworkServiceProtocol!
    let endpoint: String

    required init(view: OtherNewsTableViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, endpoint: String) {
        self.view = view
        self.router = router
        self.networkService = networkService
        self.endpoint = endpoint
        getArticles()
    }

    func tabOnTheArticles(article: Article) {
        router.showDetail(article: article)
    }

    func getArticles() {
        pageNews += 1
        self.networkService.getArticles(pageNews: pageNews, urlKey: HardCode.firstUrlKeyString, endpoint: endpoint) { [weak self] result in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    if (articles.count != 0) {
                        self.arrayArticles.append(contentsOf: articles)
                        self.view?.success()
                    }
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
