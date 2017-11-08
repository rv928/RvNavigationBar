//
//  DashboardViewController.swift
//  CustomNavigationBar
//
//  Created by Ravi Vora on 08/11/17.
//  Copyright © 2017 Ravi Vora. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    
    
    // MARK:- View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        setNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.showCustomTopBar = false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK:- Navigation bar Methods
    
    func setNavigationBar(){
        RvnavigationBar.sharednavigationBar.setNavigationBar(self)
    }
    
    override func leftAction(_ button: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    override func rightAction(_ button: UIButton) {
        
        let center = RvnavigationBar.sharednavigationBar.LoginViewController()
        let nav = UINavigationController(rootViewController: center)
        ((UIApplication.shared.delegate as! AppDelegate)).window!.rootViewController = nav
    }
}
