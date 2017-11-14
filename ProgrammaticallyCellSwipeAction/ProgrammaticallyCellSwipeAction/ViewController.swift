//
//  ViewController.swift
//  ProgrammaticallyCellSwipeAction
//
//  Created by Juber Moulvi Abdul on 15/11/17.
//  Copyright © 2017 Juber Moulvi Abdul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var customCellSwipeTableView : UITableView!
    var selectedIndexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customCellSwipeTableView.register(UINib(nibName: "CustomSwipeCell", bundle: nil), forCellReuseIdentifier: "CustomSwipeCell")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        swipeCellFor(tableView: customCellSwipeTableView, atIndex: selectedIndexPath)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomSwipeCell", for: indexPath) as! CustomSwipeCell
        cell.nameLabel.text = "www.zubiscube.com"
        if (indexPath.row == 5) {
            selectedIndexPath = indexPath
        }
        return cell
        
    }
    
    func swipeCellFor(tableView: UITableView, atIndex indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath as IndexPath);
        
        // Width of the SwipeView which has been set in XIB
        let swipeViewWidth : CGFloat  = 200
        
        // UIView extension to access the XIB view
        let swipeView: SwipeView? = .swipeViewFromNib()
        let frame : CGRect = CGRect(x: cell!.bounds.size.width , y: 0, width: swipeViewWidth, height: cell!.bounds.size.height)
        swipeView?.frame = frame
        
        // Add SwipeView to the cell which has been selected (from stored indexpath, as that is the one which is slected programmatically)
        cell!.addSubview(swipeView!)
        
        // 3.0 is the duration in seconds. Set accordingly for your requirement
        UIView.animate(withDuration: 3.0, animations: {
            // Programmatically swipe left (Illusion)
            cell!.frame = CGRect.init(x: cell!.frame.origin.x - swipeViewWidth, y: cell!.frame.origin.y, width: cell!.bounds.size.width + swipeViewWidth, height: cell!.bounds.size.height)
        }) { (finished) in
            // Once swipe left is finish, do swipe right (Illusion) to hide the SwipeView
            UIView.animate(withDuration: 3.0, animations: {
                cell!.frame = CGRect.init(x: cell!.frame.origin.x + swipeViewWidth, y: cell!.frame.origin.y, width: cell!.bounds.size.width - swipeViewWidth, height: cell!.bounds.size.height)
            }, completion: { (finished) in
                swipeView?.removeFromSuperview()
            })
        }
    }
    
}






