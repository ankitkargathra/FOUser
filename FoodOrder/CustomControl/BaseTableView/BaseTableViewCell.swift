//
//  BaseTableViewCell.swift
//  FoodOrder
//
//  Created by Rohan on 08/10/18.
//  Copyright © 2018 Ankit Kargathra. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    var sepratorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if sepratorView == nil  {

            sepratorView = UIView.init()
            sepratorView.translatesAutoresizingMaskIntoConstraints = false
            sepratorView.backgroundColor = UIColor.colorGray()
            self.contentView.addSubview(sepratorView)

        }
        
        NSLayoutConstraint.activate([
            self.sepratorView.heightAnchor.constraint(equalToConstant: 0.3),
            self.sepratorView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0),
            self.sepratorView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 18.3),
            self.sepratorView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -18.3)
            ])
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
