//
//  ItemTableViewCell.swift
//  DemoProject
//
//  Created by Zentech-038 on 31/05/24.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var viewCategory: UIView!
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblItemDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewCategory.layer.cornerRadius = viewCategory.frame.height / 2
        innerView.layer.cornerRadius = 15
        
        roundTopCorners(of: imgItem, radius: 15)
                
    }
    
    func roundTopCorners(of imageView: UIImageView, radius: CGFloat) {
            let path = UIBezierPath(roundedRect: imageView.bounds,
                                    byRoundingCorners: [.topLeft, .topRight],
                                    cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            imageView.layer.mask = mask
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
