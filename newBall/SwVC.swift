//
//  SwVC.swift
//  newBall
//
//  Created by Macbook Pro on 7/19/17.
//  Copyright © 2017 Macbook Pro. All rights reserved.
//

import UIKit

class SwVC: UIViewController {

    
    @IBOutlet weak var selectorXConstraint: NSLayoutConstraint!
    @IBOutlet weak var coverupView: UIView!
 
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var t3rdSegmentBtn: UIButton!
    @IBOutlet weak var s2ndSegmentBtn: UIButton!
    @IBOutlet weak var f1thSegmentBtn: UIButton!
    @IBOutlet weak var f4thSegmentBtn: UIButton!
    var originalXcor : CGFloat!
    var viewWidth : CGFloat!
    var maxWidth : CGFloat!
    var currentWidthDistance : CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()

        let  swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:))   )
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
    self.view.addGestureRecognizer(swipeRight)
        let  swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:))   )

        swipeleft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeleft)
 
        originalXcor = selectorXConstraint.constant
        viewWidth = self.coverupView.bounds.size.width
        

    }
    
    func respondToSwipeGesture(_ gestureReconizer: UISwipeGestureRecognizer) {
 
        
        if gestureReconizer.direction == UISwipeGestureRecognizerDirection.left {
             guard  f1thSegmentBtn.frame.origin.x != selectorXConstraint.constant else {
                return
            }
UIView.animate(withDuration: 0.4, animations: {
 
    self.iconImage.transform = CGAffineTransform(rotationAngle: CGFloat(CGFloat.pi * 0.999))
 }, completion: { (true ) in
    UIView.animate(withDuration: 0.3, animations: {
        self.iconImage.transform = .identity })
})
              if f4thSegmentBtn.frame.origin.x == selectorXConstraint.constant  {//pick 3rd btn
                SegmentAction(t3rdSegmentBtn)
            }else if t3rdSegmentBtn.frame.origin.x == selectorXConstraint.constant  {// pick 2nd btn
                SegmentAction(s2ndSegmentBtn)
            }else if s2ndSegmentBtn.frame.origin.x == selectorXConstraint.constant  { // pick 1st
                SegmentAction(f1thSegmentBtn)
            }
            
         /*   UIView.animate(withDuration: 0.3, animations: {
                 self.selectorXConstraint.constant  -= self.viewWidth
             //   print(" acutal width : \(self.view.bounds.size.width) signal view Size :\(self.viewWidth) that's the current X : \(self.selectorXConstraint.constant) and that' the original : \(self.originalXcor)" )
                self.view.layoutIfNeeded()
            })*/
       
        }else { //Right Swipe
            guard  f4thSegmentBtn.frame.origin.x != selectorXConstraint.constant else {
                return
            }
            UIView.animate(withDuration: 0.4, animations: {
                self.iconImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi ))
            }, completion: { (true ) in
                UIView.animate(withDuration: 0.3, animations: {
                    self.iconImage.transform = .identity })
            })
             if selectorXConstraint.constant == f1thSegmentBtn.frame.origin.x  {//pick 2nd btn
                SegmentAction(s2ndSegmentBtn)
            }else if s2ndSegmentBtn.frame.origin.x == selectorXConstraint.constant  {// pick 3rd btn
                  SegmentAction(t3rdSegmentBtn)
            }else if t3rdSegmentBtn.frame.origin.x == selectorXConstraint.constant  { // pick 4th
                  SegmentAction(f4thSegmentBtn)
            }
         /*   UIView.animate(withDuration: 0.3, animations: {
                
                self.selectorXConstraint.constant  += self.viewWidth
               //print(" acutal width : \(self.view.bounds.size.width) signal view Size :\(self.viewWidth) that's the current X : \(self.selectorXConstraint.constant) and that' the original : \(self.originalXcor)" )
  self.view.layoutIfNeeded()
            })*/
         }
   // print("swipped ")
    
    }

    @IBAction func SegmentAction(_ sender: UIButton) {
        print("that's the new x : \(sender.frame.origin.x)")
    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.78, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
        self.selectorXConstraint.constant = sender.frame.origin.x
        self.view.layoutIfNeeded()
        })
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.78, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {

        self.iconImage.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        }, completion: { (true) in
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.78, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                    self.iconImage.transform = .identity
                    
                } )})
        switch sender {
        case f1thSegmentBtn: print("f1thSegmentBtn Btn ")
        self.view.backgroundColor = .brown
    
            break
        case s2ndSegmentBtn :  print("s2ndSegmentBtn Btn ");
               self.view.backgroundColor = .yellow
            break
        case t3rdSegmentBtn : print("t3rdSegmentBtn Btn ")
               self.view.backgroundColor = .green;break
        default:
                   self.view.backgroundColor = .purple
            print("4th Btn ")
        }
    }
 
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
