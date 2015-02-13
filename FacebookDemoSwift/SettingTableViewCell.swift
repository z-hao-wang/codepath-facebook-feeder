//
//  SettingTableViewCell.swift
//  FacebookDemoSwift
//
//  Created by Hao Wang on 2/11/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit
protocol delegateSwitch {
    func switchChanged(on: Bool, cell: UITableViewCell)
}
class SettingTableViewCell: UITableViewCell {
    
    var delegate:delegateSwitch?

    @IBOutlet weak var switchVar: UISwitch!
    @IBOutlet weak var settingName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .None
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func didSwitchChange(sender: UISwitch) {
        delegate?.switchChanged(sender.on, cell: self)
    }

}
