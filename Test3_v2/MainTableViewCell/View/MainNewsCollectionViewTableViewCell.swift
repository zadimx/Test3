//
//  CollectionViewTableViewCell.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 17.11.2021.
//

import UIKit

class MainNewsCollectionViewTableViewCell: UITableViewCell, UICollectionViewDataSource {
  var mainNewsPresenter: MainNewsCollerctionViewTableViewCellPresenterProtocol!
  @IBOutlet weak var collectionView: UICollectionView! {
    didSet {
      collectionView.register(MainNewsCollectionViewCell.nib(), forCellWithReuseIdentifier: MainNewsCollectionViewCell.identifier)
    }
  }
  @IBOutlet weak var view: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    collectionView.delegate = self
    collectionView.dataSource = self
    view.addSubview(collectionView)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainNewsCollectionViewCell.identifier, for: indexPath) as! MainNewsCollectionViewCell
    cell.setData(with: mainNewsPresenter.arrayArticles[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    if (indexPath.row == (mainNewsPresenter.arrayArticles.count-1)) {
      mainNewsPresenter.getArticles()
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let data = mainNewsPresenter.arrayArticles[indexPath.row]
    mainNewsPresenter.tabOnTheArticles(articles: data)
  }
}


// MARK: UICollectionViewDataSource
extension MainNewsCollectionViewTableViewCell: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return mainNewsPresenter.arrayArticles.count
  }
}

extension MainNewsCollectionViewTableViewCell: OtherNewsTableViewProtocol {
  func success() {
    collectionView.reloadData()
  }
  
  func failure(error: Error) {
    print("OSHIBKA \(error)")
  }
}
