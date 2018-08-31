//
//  ViewController.swift
//  CoverFlowDemo
//
//  Created by 苏文潇 on 2017/9/12.
//  Copyright © 2017年 Koalareading. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    
    var collectionView: UICollectionView!
    var flowLayout: KRFlowLayout!
//    记录是第几个
    var index: Int = 0
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.orange
        label.text = "第1个"
        label.textAlignment = .center
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setControllerView()
        self.view.addSubview(titleLabel)
        
        titleLabel.center.x = self.view.center.x
        titleLabel.bounds = CGRect(x: 0, y: 0, width: 60, height: 24)
        titleLabel.center.y = 280
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    private func setControllerView()
    {
        let flowLayout: KRFlowLayout = KRFlowLayout()
        self.flowLayout = flowLayout
        let collectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.frame = CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: 200)
        collectionView.backgroundColor = UIColor.orange
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        self.collectionView = collectionView
//        告诉系统使用之前的生命周期，解决了ios的bug
        collectionView.isPrefetchingEnabled = false
//        collectionView.center = self.view.center
        collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cellID")
        
        self.view.addSubview(collectionView)
        
        
        flowLayout.collecCellIndexCallBack = { [weak self] (index) in
            self?.index = index.row
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20 + 2//(一定要多两个，否则效果会出现问题)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
        
        if indexPath.row == 0
        {
            cell.isUserInteractionEnabled = false
            cell.layer.borderWidth = 0
            cell.layer.borderColor = UIColor.clear.cgColor
            cell.backgroundView = UIImageView.init(image: UIImage(named: ""))
        }
        else if indexPath.row == 20 + 1
        {
            cell.isUserInteractionEnabled = false
            cell.layer.borderWidth = 0
            cell.layer.borderColor = UIColor.clear.cgColor
            cell.backgroundView = UIImageView.init(image: UIImage(named: ""))
        }
        else
        {
            cell.isUserInteractionEnabled = true
            cell.layer.borderWidth = 3
            cell.layer.borderColor = UIColor.white.cgColor
            cell.backgroundView = UIImageView.init(image: UIImage(named: "1"))
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        titleLabel.text = "第\(indexPath.row)个"
        collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)

    }
    
    

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        self.titleLabel.text = "第\(index)个"
        
    }


    //    MARK:加载数据
    private func loadData()
    {
        
    }
    
}






