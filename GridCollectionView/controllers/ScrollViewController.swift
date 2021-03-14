//
//  ScrollViewController.swift
//  GridCollectionView
//
//  Created by Shakhzod Ilkhomov on 15/03/21.
//

import UIKit

class ScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }

    
    //MARK: - Methods
    
    func initViews(){
        initNavigationBar()
    }
    
    func initNavigationBar(){
        title = "Scroll View"
        
        let back = UIImage(named: "ic_back")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(onBackPressed))
    }
    
    @objc func onBackPressed(){
        navigationController?.popViewController(animated: false)
    }
}
