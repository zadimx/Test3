//
//  ContentView.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 23.12.2021.
//

import UIKit

class ContentView: UIView {
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var historyLabel: UILabel!
  @IBOutlet weak var topicTextView: UILabel!
  let nibName = "ContentView"
      var contentView: UIView!
  override func awakeFromNib() {
      super.awakeFromNib()
  }
  
  func setupData(data: Article) {
      self.dateLabel.text = HardCode().dateFormatOtherNews(dateString: data.publishedAt)
      self.historyLabel.text = data.source?.name
      self.topicTextView.text = data.title
  }

    required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
          commonInit()
      }
  override init(frame: CGRect) {
          super.init(frame: frame)
          commonInit()
      }
  func commonInit() {
          guard let view = loadViewFromNib() else { return }
          view.frame = self.bounds
          self.addSubview(view)
          contentView = view
      }
      func loadViewFromNib() -> UIView? {
          let bundle = Bundle(for: type(of: self))
          let nib = UINib(nibName: nibName, bundle: bundle)
          return nib.instantiate(withOwner: self, options: nil).first as? UIView
      }
  
//  public func layoutAttachAll(to childView:UIView) {
//      var constraints = [NSLayoutConstraint]()
//
//      childView.translatesAutoresizingMaskIntoConstraints = false
//    constraints.append(NSLayoutConstraint(item: childView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0))
//      constraints.append(NSLayoutConstraint(item: childView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0))
//      constraints.append(NSLayoutConstraint(item: childView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0))
//      constraints.append(NSLayoutConstraint(item: childView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0))
//      childView.addConstraints(constraints)
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
