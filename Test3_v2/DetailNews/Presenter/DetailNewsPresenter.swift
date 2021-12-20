//
//  DetailCollectionViewPresenter.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 17.11.2021.
//

import Foundation
import UIKit

protocol DetailNewsProtocol: class {
  func setData(dataArticles: Articles)
}

protocol DetailNewsPresenterProtocol: class {
  init(view: DetailNewsProtocol, router: RouterProtocol, data: Articles)
  func setData()
}

class DetailNewsPresenter: DetailNewsPresenterProtocol {
  weak var view: DetailNewsProtocol?
  var router: RouterProtocol?
  let data: Articles
  
  required init(view: DetailNewsProtocol ,router: RouterProtocol, data: Articles) {
    self.view = view
    self.router = router
    self.data = data
  }
  
  func setData() {
    self.view?.setData(dataArticles: data)
  }
}
