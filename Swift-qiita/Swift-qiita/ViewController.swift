//
//  ViewController.swift
//  Swift-qiita
//
//  Created by massu_fun on 2020/09/10.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,
UICollectionViewDelegate{
    
    let imagePhoto = "id"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        //Cellはストーリーボードで設定したID
        let testCell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        //Tag番号を使ってImageViewのインスタンス生成
        let imageView = testCell.contentView.viewWithTag(3) as! UIImageView
        let cellImage = UIImage(named: imagePhoto)
        imageView.image = cellImage
        
        let labelTitle = testCell.contentView.viewWithTag(1) as! UILabel
        labelTitle.text = "helloworld"
        
        let labelId = testCell.contentView.viewWithTag(2) as! UILabel
        labelId.text = "hogehoge"
        
        return testCell
    }
    
    // Screenサイズに応じたセルサイズを返す
    func collectionView(_ collection: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        //横方向のスペース調整
        let horizontalSpace:CGFloat = 2
        let cellSize:CGFloat = self.view.bounds.width/2 - horizontalSpace
        //正方形で返すためにwidthとheightを同じにする
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    // セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        return cell
    }
    // セルの行数を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
}

