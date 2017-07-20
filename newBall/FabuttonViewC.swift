//
//  FabuttonViewC.swift
//  newBall
//
//  Created by Macbook Pro on 7/19/17.
//  Copyright © 2017 Macbook Pro. All rights reserved.
//

import UIKit

class FabuttonViewC: UIViewController {

    //https://gist.github.com/kapoorsahil/a38df56ad216ade1332b04e15f470c80
    private lazy var button: UIButton = {
        let minimumTappableHeight: CGFloat = 55
        let button = UIButton(frame: CGRect(x: 67, y: 45, width: minimumTappableHeight, height: minimumTappableHeight))
//        button.center = self.view.center
        button.layer.cornerRadius = minimumTappableHeight / 2
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor.darkGray
        button.setImage(#imageLiteral(resourceName: "ball_pic"), for: .normal)
        //            button.setTitle("+", for: .normal)
        //            button.setTitle("*", for: .highlighted)
        
        return button
    }()
    
  private   var panGESTURE = UIPanGestureRecognizer()
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(button)
        button.addTarget(self, action: #selector(self.drag(control:event:)), for: UIControlEvents.touchDragInside)
        button.addTarget(self, action: #selector(self.drag(control:event:) ), for: UIControlEvents.touchDragExit)
        button.addTarget(self, action: #selector(self.touchDownEvent), for: .touchDown)
        //
        button.addTarget(self, action: #selector(self.touchUpEvent), for: [.touchUpInside, .touchUpOutside])
        
        
        let singleTap: UITapGestureRecognizer =  UITapGestureRecognizer(target: self, action: #selector(self.handleSingleTap(sender:)))
        singleTap.numberOfTapsRequired = 1
        self.button.addGestureRecognizer(singleTap)
        
        // Double Tap
        let doubleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleDoubleTap))
        doubleTap.numberOfTapsRequired = 2
        self.button.addGestureRecognizer(doubleTap)
        
        singleTap.require(toFail: doubleTap)
        singleTap.delaysTouchesBegan = true
        doubleTap.delaysTouchesBegan = true
    }

   
    
    func handleSingleTap(sender: AnyObject?) {
        
        print("Single Tap!")
        
    }
    func handleDoubleTap() {
        
        print("Double Tap!")
    }
    
    
 @objc fileprivate   func touchDownEvent(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            
            self.button.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            
        }) { (true) in
            UIView.animate(withDuration: 0.3) {
                
                self.button.transform = .identity
                
            }
        }
    }
    
  @objc fileprivate  func touchUpEvent(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.3) {
            
            var  oriY = self.button.frame.minY
            let viewWidth = self.view.bounds.width
            var oriX : CGFloat = viewWidth - self.button.bounds.width - 3
            let viewRealHeight = self.view.bounds.height - self.button.bounds.height
            //            print("that's the y  \(oriY) \n view height : \(self.view.frame.height) \n btn height : \(self.button.bounds.height  )\n realHeight = \(viewRealHeight)\n view weight : \(self.view.bounds.width)")
            //            print("that's the Btn x  \(self.button.frame.minX) \n view width : \(self.view.frame.width) viewWidth ; \(viewWidth)")
            
            oriY = oriY <= 64 ? 67 : oriY
            oriY = oriY >= viewRealHeight ?   viewRealHeight - 5 : oriY
            oriX = self.button.frame.minX <= (viewWidth / 2) ? 0 :   oriX
                        print("that's the new oriY : \(oriY)\n view width : \(self.view.frame.height) ")
            let frame =  CGRect(x: oriX, y: oriY, width: sender.frame.size.width  , height: sender.frame.size.height)
            
            self.button.frame = frame
        }
    }
   @objc fileprivate func drag(control: UIControl, event: UIEvent) {
        
        if let center = event.allTouches!.first?.location(in: self.view) {
            control.center = center
        }else {
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
