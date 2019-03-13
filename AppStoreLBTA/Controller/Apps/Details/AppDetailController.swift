//
//  AppDetailController.swift
//  AppStoreLBTA
//
//  Created by Lasse Silkoset on 11/03/2019.
//  Copyright © 2019 Lasse Silkoset. All rights reserved.
//

import UIKit

class AppDetailController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    var appId: String! {
        didSet {
            
            Service.shared.fetchGenericJSONData(urlString: "https://itunes.apple.com/lookup?id=\(appId ?? "")") { (result: SearchResult?, err) in
                let app = result?.results.first
                self.app = app
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
            
            let reviewsUrl = "https://itunes.apple.com/rss/customerreviews/page=1/id=\(appId ?? "")/sortby=mostrecent/json?l=en&cc=us"
            Service.shared.fetchGenericJSONData(urlString: reviewsUrl) { (reviews: Reviews?, err) in
                if let err = err {
                    print("Failed to decode reviews", err)
                    return
                }
                self.reviews = reviews
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    var app: Result?
    var reviews: Reviews?
    
    let detailCellId = "detailCellId"
    let previewCellId = "preview"
    let reviewCellId = "review"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(AppDetailsCell.self, forCellWithReuseIdentifier: detailCellId)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: previewCellId)
        collectionView.register(ReviewRowCell.self, forCellWithReuseIdentifier: reviewCellId)
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellId, for: indexPath) as! AppDetailsCell
            
            cell.app = app
            
            return cell
            
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewCellId, for: indexPath) as! PreviewCell
            
            cell.horizontalController.app = self.app
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewCellId, for: indexPath) as! ReviewRowCell
            cell.reviewsController.reviews = self.reviews
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var height: CGFloat = 280
        
        if indexPath.item == 0 {
        //Calculate size for cell
        let dummyCell = AppDetailsCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
        
        dummyCell.app = app
        dummyCell.layoutIfNeeded()
        
        let estimatedSize = dummyCell.systemLayoutSizeFitting(CGSize(width: view.frame.width, height: 1000))
        
        height = estimatedSize.height
        } else if indexPath.item == 1 {
            height = 500
        } else {
            height = 280
        }
        
        return CGSize(width: view.frame.width, height: height)
    }
}
