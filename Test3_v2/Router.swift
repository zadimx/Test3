//
//  Router.swift
//  Test3_v2
//
//  Created by Максим Зиноватный on 21.11.2021.
//

import Foundation
import UIKit
protocol RouterMain {
  var navigationController: UINavigationController? { get set }
  var assemblyBuilder: AssemblyNewsBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
  func initialViewController()
  func showDeteil(articles: Articles)
  func popToRoot()
}

class Router: RouterProtocol {
  var navigationController: UINavigationController?
  var assemblyBuilder: AssemblyNewsBuilderProtocol?
  
  init(navigationController: UINavigationController, assemblyBuilder: AssemblyNewsBuilderProtocol) {
    self.navigationController = navigationController
    self.assemblyBuilder = assemblyBuilder
  }
  
  func initialViewController() {
    if let navigationController = navigationController {
      guard let mainViewController = assemblyBuilder?.createOtherNewsModuleViewController(router: self) else { return }
      navigationController.viewControllers = [mainViewController]
    }
  }
  
  func showDeteil(articles: Articles) {
    if let navigationController = navigationController {
      guard let detailViewController = assemblyBuilder?.createDateilNewsModuleViewController(data: articles, router: self) else { return }
      navigationController.pushViewController(detailViewController, animated: true)
    }
  }
  
  func popToRoot() {
    if let navigationController = navigationController {
      navigationController.popToRootViewController(animated: true)
    }
  }
}
