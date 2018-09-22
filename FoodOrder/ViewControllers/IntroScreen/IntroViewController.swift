//
//  ViewController.swift
//  CalendarApp
//
//  Created by Ankit on 04/11/17.
//  Copyright © 2017 Ankit. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var dotImg: UIImageView!
    
    @IBOutlet var dotFst: UIView!
    @IBOutlet var dotSec: UIView!
    @IBOutlet var dotThrd: UIView!
    
    let introImgArr = [#imageLiteral(resourceName: "intro_1"),#imageLiteral(resourceName: "intro_2"),#imageLiteral(resourceName: "intro_3")]
//    let introDotImgArr = [#imageLiteral(resourceName: "introDot1"),#imageLiteral(resourceName: "introDot2"),#imageLiteral(resourceName: "introDot3")]
    let introTextArr =  ["Scan Qr Code or key in location code for list of shops and items", "Place orders and make payment directly or via cash", "Pick the right place using trusted ratings and reviews"]
    var index = 0
    @IBOutlet var nextButton: UIButton!
    

    //MARK: _______________ Life cycle  _________________
    override func viewDidLoad() {
        super.viewDidLoad()
       self.setDotColor(fstDotcolor: UIColor.dotIntroselect(), secDotcolor: UIColor.dotIntroUnselect(), thrdDotcolor: UIColor.dotIntroUnselect())
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! IntroCell
        cell.introLabel.text = introTextArr[indexPath.row]
        cell.introLabel.font = UIFont.init(name: cell.introLabel.font.fontName, size: getProportionalFont(size: 20))
        print(introTextArr[indexPath.row])
        print(cell.introLabel.font.fontName)
        cell.imageView.image = introImgArr[indexPath.row]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let cellSize = self.view.frame.size
        return CGSize.init(width: cellSize.width, height: 411)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
            UIView.animate(withDuration: 0.5, animations: {
                cell.alpha = 1.0
            }, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        UIView.animate(withDuration: 0.5, animations: {
            cell.alpha = 0
        }, completion: nil)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.setDotImage()
    }
    
    func setDotImage() {
        var visibleRect = CGRect()
        
        visibleRect.origin = collectionView.contentOffset
        visibleRect.size = collectionView.bounds.size
        
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
        let visibleIndexPath: IndexPath = collectionView.indexPathForItem(at: visiblePoint)!
        index = visibleIndexPath.row
        self.setDotIndex(index: visibleIndexPath.row)
        self.setNextButtonTitle()
    }
    
    func setDotIndex(index: Int) {
//        self.dotImg.image = introDotImgArr[index]
        if index == 0 {
            self.setDotColor(fstDotcolor: UIColor.dotIntroselect(), secDotcolor: UIColor.dotIntroUnselect(), thrdDotcolor: UIColor.dotIntroUnselect())
        } else if index == 1 {
            self.setDotColor(fstDotcolor: UIColor.dotIntroUnselect(), secDotcolor: UIColor.dotIntroselect(), thrdDotcolor: UIColor.dotIntroUnselect())
        } else if index == 2 {
            self.setDotColor(fstDotcolor: UIColor.dotIntroUnselect(), secDotcolor: UIColor.dotIntroUnselect(), thrdDotcolor: UIColor.dotIntroselect())
        }
    }
    
    func setNextButtonTitle() {
//        if index < 2 {
//            nextButton.setTitle("NEXT", for: .normal)
//        } else {
//            nextButton.setTitle("GET STARTED", for: .normal)
//        }
    }
    
    @IBAction func btnNextOrSkipPress(button: UIButton) {
       
        if button.tag==1 || button.titleLabel?.text == "GET STARTED" {
            let vcObj = self.storyboard?.instantiateViewController(withIdentifier:"SignUpViewController")
            self.navigationController?.pushViewController(vcObj!, animated:true)
              return
        }
        
        index = index + 1
        self.setDotIndex(index: index)
        self.collectionView.scrollToItem(at: IndexPath.init(row: index, section: 0), at: UICollectionViewScrollPosition.right, animated: true)
        self.setNextButtonTitle()
      
    }
    
    func setDotColor(fstDotcolor: UIColor, secDotcolor: UIColor, thrdDotcolor: UIColor) {
        self.dotFst.backgroundColor = fstDotcolor
        self.dotSec.backgroundColor = secDotcolor
        self.dotThrd.backgroundColor = thrdDotcolor
    }
}

class IntroCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var introLabel: UILabel!
}

