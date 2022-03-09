//
//  AppsController.swift
//  AppStoreJSONApis
//
//  Created by Decagon on 28/02/2022.
//

import UIKit

class AppsPageController: BaseListController, UICollectionViewDelegateFlowLayout {
    let cellId = "id"
    let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        
//        collectionView.register(AppsPageHeader.self, forCellWithReuseIdentifier: headerId)
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        fetchData()
    }
    
//    var topFreeApps: AppGroup?
    var groups = [AppGroup]()
    
    fileprivate func fetchData() {
        
        var group1: AppGroup?
        var group2: AppGroup?
        
        //help you sync your data fetches together
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchTopFreeApps { (appGroup, err) in
            
            dispatchGroup.leave()
            print("Fetch top free apps complete")
            if err != nil {
                print("failed to fetch apps")
                return
            }
            
            group1 = appGroup
        }
        
        dispatchGroup.enter()
        Service.shared.fetchTopPaidApps { (appGroup, err) in
            
            dispatchGroup.leave()
            print("Fetch top paid apps completion")
            if err != nil {
                print("failed to fetch apps")
                return
            }
            
            group2 = appGroup
        }
        
        //completion
        dispatchGroup.notify(queue: .main) {
            print("completed your dispatch group task...")
            
            if let group = group1 {
                self.groups.append(group)
            }
            
            if let group = group2 {
                self.groups.append(group)
            }
            
            self.collectionView.reloadData()
        }
    }
    
    // Dequeueing Section Header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? AppsGroupCell else { return UICollectionViewCell() }
        let appGroup = self.groups[indexPath.item]
        
        
        cell.titleLabel.text = appGroup.feed.title
        cell.horizontalController.appGroup = appGroup
        cell.horizontalController.collectionView.reloadData()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
}
