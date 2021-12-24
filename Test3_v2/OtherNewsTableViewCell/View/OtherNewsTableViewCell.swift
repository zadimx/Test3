//
//  Table.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 10.11.2021.
//

import UIKit

class OtherNewsTableViewCell: UITableViewCell {
    @IBOutlet weak var otherNewsImageNews: UIImageView!

  var content: ContentView!
  @IBOutlet var topicNameDateView: UIView!
  override func awakeFromNib() {
        super.awakeFromNib()
    
    
        content = ContentView(frame: topicNameDateView.frame)
    
    topicNameDateView.addSubview(content)
    var constraints = [NSLayoutConstraint]()
    
    content.translatesAutoresizingMaskIntoConstraints = false
    constraints.append(topicNameDateView.leadingAnchor.constraint(equalTo: content.safeAreaLayoutGuide.leadingAnchor))
    constraints.append(topicNameDateView.trailingAnchor.constraint(equalTo: content.safeAreaLayoutGuide.trailingAnchor))
    constraints.append(topicNameDateView.bottomAnchor.constraint(equalTo: content.safeAreaLayoutGuide.bottomAnchor))
    constraints.append(topicNameDateView.topAnchor.constraint(equalTo: content.safeAreaLayoutGuide.topAnchor))
    NSLayoutConstraint.activate(constraints)
        
        initialImageView(imageView: otherNewsImageNews)
    }
  
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setData(object: Article) {
        HardCode().setupUrlImage(data: object, imageView: otherNewsImageNews)
        content.setupData(data: object)
    }
}

extension OtherNewsTableViewCell {
    func initialImageView(imageView: UIImageView) {
        imageView.layer.cornerRadius = 20
    }
  

}
