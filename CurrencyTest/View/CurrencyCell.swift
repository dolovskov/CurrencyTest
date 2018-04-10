//
//  CurrencyCell.swift
//  CurrencyTest
//
//  Created by Доловсков Владислав on 10.04.2018.
//  Copyright © 2018 Доловсков Владислав. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell {
    
    static let cellIdentifier = "CurrencyCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    
    var viewModel: CurrencyCellViewModel! {
        didSet {
            nameLabel.text = viewModel.name
            amountLabel.text = viewModel.amount
            volumeLabel.text = viewModel.volume
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
