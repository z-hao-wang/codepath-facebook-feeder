//
//  SettingsViewController.swift
//  FacebookDemoSwift
//
//  Created by Hao Wang on 2/11/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, delegateSwitch {
    
    @IBOutlet weak var closeBtn: UIButton!
    let settingsTxt = ["Links", "Statuses", "Photos", "Videos"]
    var settings = Dictionary<String, Bool>()

    @IBOutlet weak var applyBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func didTapClose(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("settingCell", forIndexPath: indexPath) as SettingTableViewCell
        cell.switchVar.on = false
        if let settingVal = settings[settingsTxt[indexPath.row]]{
            cell.switchVar.on = settingVal
        }
        cell.settingName.text = settingsTxt[indexPath.row]
        cell.delegate = self
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func switchChanged(on: Bool, cell: UITableViewCell) {
        if let indexPath = tableView.indexPathForCell(cell) {
            for key in settingsTxt {
                settings[key] = false
            }
            self.settings[settingsTxt[indexPath.row]] = on
            tableView.reloadData()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
