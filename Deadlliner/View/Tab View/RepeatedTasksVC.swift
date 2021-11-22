//
//  RepeatedTasksVC.swift
//  Deadlliner
//
//  Created by Arman on 14.11.2021.
//

import UIKit

class RepeatedTasksVC: UIViewController {
 
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func deleteTapped(_ sender: UIBarButtonItem) {
        
    }
    @IBAction func editTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func homeTapped(_ sender: UIBarButtonItem) {
    }
    
}

extension UIViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! RepeatedTasksCollectionViewCell
        
        cell.titleLabel.text = "Title"
        cell.categoryLabel.text = "Category"
        cell.deadlineLabel.text = "2002/12/07"
        
        return cell
    }
    
    
}
