//
//  HomeViewController.swift
//  GridCollectionView
//
//  Created by Shakhzod Ilkhomov on 15/03/21.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let numberOfColumns: CGFloat = 2
    var items: Array<Item> = Array()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
    }
    
    
    //MARK: - Methods
    
    func initViews(){
        initNavigationBar()
        initItems()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            let screenSize: CGRect = UIScreen.main.bounds
            let cellWidth = screenSize.width / numberOfColumns - 15
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }
        
    }
    
    func initItems(){
        items.append(Item(image: "image_bear", title: "Bear"))
        items.append(Item(image: "image_bigcat", title: "Lion"))
        items.append(Item(image: "image_cat", title: "Cat"))
        items.append(Item(image: "image_panda", title: "Panda"))
        items.append(Item(image: "image_elephant", title: "Elephant"))
        items.append(Item(image: "image_wolf", title: "Wolf"))
        items.append(Item(image: "image_zebra", title: "Zebra"))
        items.append(Item(image: "image_fox", title: "Fox"))
    }
    
    
    //MARK: - Navigation Bar
    
    func initNavigationBar(){
        title = "Collection View"
        
        let list = UIImage(named: "ic_list")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: list, style: .plain, target: self, action: #selector(onRightIconTapped))
    }
    
    @objc func onRightIconTapped(){
        callScrollViewController()
    }
    
    func callScrollViewController(){
        let vc = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    //MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ItemCollectionViewCell
        cell.imageView.image = UIImage(named: item.image!)
        cell.imageTitle.text = item.title!
        return cell
    }
    
}

