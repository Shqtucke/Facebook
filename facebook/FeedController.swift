//
//  ViewController.swift
//  facebook
//
//  Created by Shaun Tucker on 3/16/18.
//  Copyright © 2018 Shaun Tucker. All rights reserved.
//

import UIKit

let cellId = "cellId"

class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Futucke Inc"
        
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

   
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 60)
    }


}

class FeedCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Futucke Inc"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    func setupViews() {
        
        backgroundColor = UIColor.white
        
        addSubview(nameLabel)
        addSubview(profileImageView)
        
        addConstraintsWithFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
        
        addConstraintsWithFormat(format: "V:|[v0]|", views: nameLabel)
        addConstraintsWithFormat(format: "V:|-8-[v0(44)]|", views: profileImageView)
        
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
//
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(44)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": profileImageView]))
        
    }
}

extension UIView {
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}











