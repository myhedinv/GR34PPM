//
//  TableViewCell.swift
//  GR34PPM
//
//  Created by user252234 on 2/28/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "customCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }
    
    public func configure(withTitle: String) {
        nameButton.setTitle(withTitle, for: .normal)
    }
    

    @IBOutlet weak var nameButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onClickButton(_ sender: UIButton) {
    }
}
