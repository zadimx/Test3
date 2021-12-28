//
//  TableViewController.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 09.11.2021.
//

import UIKit

class OtherNewsTableViewViewController: UIViewController, UITableViewDelegate {
    var flagSendRequest = false
    var otherNewsPresenter: OtherNewsTableViewPresenterProtocol!

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "MainNewsCollectionViewTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "CollectionView")
            tableView.register(UINib(nibName: "OtherNewsTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "TableViewCell")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.navigationItem.title = "Browse News"
        view.addSubview(tableView)
    }
}

extension OtherNewsTableViewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return otherNewsPresenter.arrayArticles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            tableView.rowHeight = HardCode.rowHeightCollectionView
            let cell = self.otherNewsPresenter.router.assemblyBuilder?.createMainNewsModuleTableViewCell(router: self.otherNewsPresenter.router, tableView: tableView, indexPath: indexPath)
            return cell!
        } else {
            tableView.rowHeight = HardCode.rowHeightTableView
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? OtherNewsTableViewCell
            HardCode().setupData(object: otherNewsPresenter.arrayArticles[indexPath.row], imageView: cell!.otherNewsImageNews, view: cell!.content)
            return cell!
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = otherNewsPresenter.arrayArticles[indexPath.row]
        otherNewsPresenter.tabOnTheArticles(articles: data)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if (offsetY > contentHeight - scrollView.frame.size.height && !flagSendRequest) {
            flagSendRequest = true
            otherNewsPresenter.getArticles()
        }
    }
}

extension OtherNewsTableViewViewController: OtherNewsTableViewProtocol {
    func success() {
        tableView.reloadData()
        flagSendRequest = false
    }

    func failure(error: Error) {
        print("OSHIBKA \(error)")
    }
}
