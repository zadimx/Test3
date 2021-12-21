//
//  MainBuilder.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 09.11.2021.
//

import Foundation
import UIKit

protocol AssemblyNewsBuilderProtocol {
    func createOtherNewsModuleViewController(router: RouterProtocol) -> UIViewController
    func createDetailNewsModuleViewController(data: Article, router: RouterProtocol) -> UIViewController
    func createMainNewsModuleTableViewCell(router: RouterProtocol, tableView: UITableView, indexPath: IndexPath) -> MainNewsCollectionViewTableViewCell
}

class AssemblyModelBuilder: AssemblyNewsBuilderProtocol {
    func createDetailNewsModuleViewController(data: Article, router: RouterProtocol) -> UIViewController {
        let view = DetailNewsViewController()
        let detailNewsPresenter = DetailNewsPresenter(view: view, router: router, data: data)
        view.detailNewsPresenter = detailNewsPresenter
        return view
    }

    func createMainNewsModuleTableViewCell(router: RouterProtocol, tableView: UITableView, indexPath: IndexPath) -> MainNewsCollectionViewTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionView", for: indexPath) as? MainNewsCollectionViewTableViewCell
        let networkService = NetworkService()
        let mainNewsPresenter = MainNewsCollectionViewTableViewCellPresenter(view: cell!, networkService: networkService, router: router, endpoint: HardCode.endpointUrlMainNews)
        cell?.mainNewsPresenter = mainNewsPresenter
        return cell!
    }

    func createOtherNewsModuleViewController(router: RouterProtocol) -> UIViewController {
        let view = OtherNewsTableViewViewController()
        let networkService = NetworkService()
        let otherNewsPresenter = OtherNewsTableViewPresenter(view: view, networkService: networkService, router: router, endpoint: HardCode.endpointUrlOtherNews)
        view.otherNewsPresenter = otherNewsPresenter
        return view
    }
}
