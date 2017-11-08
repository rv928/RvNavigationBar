//
//  LoginViewController.swift
//  CustomNavigationBar
//
//  Created by Ravi Vora on 08/11/17.
//  Copyright © 2017 Ravi Vora. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    
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
        RvnavigationBar.sharednavigationBar.hideNavigationbar(self, isHide: true)
    }

    // MARK:- User Action Methods
    
    @IBAction func loginbuttonClicked(_ sender: UIButton) {
        
        let objDashBoardViewController = self.storyboard!.instantiateViewController(withIdentifier: TagIDConstant.storyBoardIDs.kDashBoardViewControllerID) as! DashboardViewController
        self.navigationController!.pushViewController(objDashBoardViewController, animated: false)
    }

}
