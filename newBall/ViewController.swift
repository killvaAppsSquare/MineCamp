////

//
//  ViewController.swift
//  newBall
//
//  Created by Macbook Pro on 7/3/17.
//  Copyright © 2017 Macbook Pro. All rights reserved.
//

import UIKit

class ViewController: FabuttonViewC {
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var ball: UIImageView!
    
    
    @IBOutlet weak var viewsss: UIView!
    lazy var animator: UIDynamicAnimator = {
        return UIDynamicAnimator(referenceView: self.viewsss)
    }()
    
    lazy var gravity:UIGravityBehavior = {
        let lazyGravity = UIGravityBehavior()
        return lazyGravity
    }()
    
    
    var lazyme : String? {
        didSet {
            print("that's it : \(lazyme)")
        }
    }
    
    lazy var collider:UICollisionBehavior = {
        let lazyCollider = UICollisionBehavior()
        // This line, makes the boundries of our reference view a boundary
        // for the added items to collide with.
        lazyCollider.translatesReferenceBoundsIntoBoundary = true
        return lazyCollider
    }()
    
    // This is how our animate function will look like
    func animateSquare(){
        animator.addBehavior(gravity)
        // Add the collider also to the animator
        animator.addBehavior(collider)
        
        // Add the squareView to both behaviors
        //        collider.addItem(ball)
        //        gravity.addItem(ball)
        collider.addItem(viewsss)
        gravity.addItem(viewsss)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.edgesForExtendedLayout = []

    }
    
       
    /*
     func didDragged() {
     //
     //        let mypoint = panGESTURE.location(in: self.view)
     let newFrme = CGRect(x: mypoint.x, y: mypoint.y, width: myView.frame.size.width, height: myView.frame.size.height)
     //        myView.frame = newFrme
     }
     */
    
    @IBAction func act(_ sender: UIButton) {
        //
        //        let alert = UIAlertController(title: " ", message: " ", preferredStyle: UIAlertControllerStyle.actionSheet)
        //        alert.addAction(UIAlertAction(title: "Tada", style: .default, handler: nil  ))
        //        alert.addAction(UIAlertAction(title: "Dom Dom ", style: .destructive, handler: nil))
        ////        alert.modalPresentationStyle  = .popover
        ////        let ppc = alert.popoverPresentationController
        ////        ppc?.permittedArrowDirections = .any
        //        present(alert, animated: true, completion: nil )
        let minimumTappableHeight: CGFloat = 44
        
    }
    @IBAction func gobackWithSegue( segue : UIStoryboardSegue) {
        
        if segue.source is ViewController2 {
            print("Recived")
        }
    }
    
    override func handleSingleTap(sender: AnyObject?) {
        
        print("SUPPPP")
    }
    
    override func handleDoubleTap() {
        super.handleDoubleTap()
        print("Told u ")
    }
    
}



////  ViewController.swift
////  newBall
////
////  Created by Macbook Pro on 7/3/17.
////  Copyright © 2017 Macbook Pro. All rights reserved.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//    
//    @IBOutlet weak var myView: UIView!
//    @IBOutlet weak var ball: UIImageView!
//    
//    
//    @IBOutlet weak var viewsss: UIView!
//    lazy var animator: UIDynamicAnimator = {
//        return UIDynamicAnimator(referenceView: self.viewsss)
//    }()
//    
//    lazy var gravity:UIGravityBehavior = {
//        let lazyGravity = UIGravityBehavior()
//        return lazyGravity
//    }()
//    
//    
//    var lazyme : String? {
//        didSet {
//            print("that's it : \(lazyme)")
//        }
//    }
//    
//    lazy var collider:UICollisionBehavior = {
//        let lazyCollider = UICollisionBehavior()
//        // This line, makes the boundries of our reference view a boundary
//        // for the added items to collide with.
//        lazyCollider.translatesReferenceBoundsIntoBoundary = true
//        return lazyCollider
//    }()
//    
//    // This is how our animate function will look like
//    func animateSquare(){
//        animator.addBehavior(gravity)
//        // Add the collider also to the animator
//        animator.addBehavior(collider)
//        
//        // Add the squareView to both behaviors
//        //        collider.addItem(ball)
//        //        gravity.addItem(ball)
//        collider.addItem(viewsss)
//        gravity.addItem(viewsss)
//    }
//    var oriX : CGFloat?
//    
//    
//    //https://gist.github.com/kapoorsahil/a38df56ad216ade1332b04e15f470c80
//    private lazy var button: UIButton = {
//        let minimumTappableHeight: CGFloat = 44
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: minimumTappableHeight, height: minimumTappableHeight))
//        button.center = self.view.center
//        button.layer.cornerRadius = minimumTappableHeight / 2
//        button.layer.masksToBounds = true
//        button.backgroundColor = UIColor.darkGray
//        button.setImage(#imageLiteral(resourceName: "ball_pic"), for: .normal)
//        //            button.setTitle("+", for: .normal)
//        //            button.setTitle("*", for: .highlighted)
//        
//        return button
//    }()
//    
//    var panGESTURE = UIPanGestureRecognizer()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.addSubview(button)
//        button.addTarget(self, action: #selector(drag(control:event:)), for: UIControlEvents.touchDragInside)
//        button.addTarget(self, action: #selector(drag(control:event:) ), for: UIControlEvents.touchDragExit)
//        button.addTarget(self, action: #selector(self.touchDownEvent), for: .touchDown)
//        
//        button.addTarget(self, action: #selector(self.touchUpEvent), for: [.touchUpInside, .touchUpOutside])
//    }
//    
//    func touchDownEvent(_ sender: AnyObject) {
//        let viewWidth = self.view.bounds.width
//        //            print("that's the y  \(oriY) \n view height : \(self.view.frame.height) \n btn height : \(self.button.bounds.height  )\n realHeight = \(viewRealHeight)\n view weight : \(self.view.bounds.width)")
//        //            print("that's the Btn x  \(self.button.frame.minX) \n view width : \(self.view.frame.width) viewWidth ; \(viewWidth)")
//        
//        oriX = self.button.frame.minX <= (viewWidth / 2) ? -3 :   oriX
//        print("that's the buttonx :\(self.button.frame.minX) and that's the oriX :\(oriX)")
//        guard let xCor = oriX , xCor !=  0 || xCor !=  viewWidth - self.button.bounds.width - 3 || xCor != -3 else {
//            print("Clicked")
//            return
//        }
//        
//        
//        
//        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
//            
//            self.button.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
//            
//        }) { (true) in
//            UIView.animate(withDuration: 0.3) {
//                
//                self.button.transform = .identity
//                
//            }
//        }
//    }
//    
//    func touchUpEvent(_ sender: AnyObject) {
//        UIView.animate(withDuration: 0.3) {
//            
//            var  oriY = self.button.frame.minY
//            let viewWidth = self.view.bounds.width
//            self.oriX  = viewWidth - self.button.bounds.width - 3
//            let viewRealHeight = self.view.bounds.height - self.button.bounds.height
//            //            print("that's the y  \(oriY) \n view height : \(self.view.frame.height) \n btn height : \(self.button.bounds.height  )\n realHeight = \(viewRealHeight)\n view weight : \(self.view.bounds.width)")
//            //            print("that's the Btn x  \(self.button.frame.minX) \n view width : \(self.view.frame.width) viewWidth ; \(viewWidth)")
//            
//            oriY = oriY <= 0 ? 0 : oriY
//            oriY = oriY >= viewRealHeight ?   viewRealHeight - 3 : oriY
//            self.oriX = self.button.frame.minX <= (viewWidth / 2) ? -3 :   self.oriX
//            //            print("that's the new x : \(oriX)\n view width : \(self.view.frame.width) ")
//            let frame =  CGRect(x: self.oriX!, y: oriY, width: sender.frame.size.width  , height: sender.frame.size.height)
//            
//            self.button.frame = frame
//        }
//    }
//    func drag(control: UIControl, event: UIEvent) {
//        
//        if let center = event.allTouches!.first?.location(in: self.view) {
//            control.center = center
//        }else {
//        }
//    }
//    
//    
//    /*
//     func didDragged() {
//     //
//     //        let mypoint = panGESTURE.location(in: self.view)
//     let newFrme = CGRect(x: mypoint.x, y: mypoint.y, width: myView.frame.size.width, height: myView.frame.size.height)
//     //        myView.frame = newFrme
//     }
//     */
//    
//    @IBAction func act(_ sender: UIButton) {
//        //
//        //        let alert = UIAlertController(title: " ", message: " ", preferredStyle: UIAlertControllerStyle.actionSheet)
//        //        alert.addAction(UIAlertAction(title: "Tada", style: .default, handler: nil  ))
//        //        alert.addAction(UIAlertAction(title: "Dom Dom ", style: .destructive, handler: nil))
//        ////        alert.modalPresentationStyle  = .popover
//        ////        let ppc = alert.popoverPresentationController
//        ////        ppc?.permittedArrowDirections = .any
//        //        present(alert, animated: true, completion: nil )
//        let minimumTappableHeight: CGFloat = 44
//        self.button = UIButton(frame: CGRect(x: 0, y: 0, width: minimumTappableHeight, height: minimumTappableHeight))
//        
//    }
//    @IBAction func gobackWithSegue( segue : UIStoryboardSegue) {
//        
//        if segue.source is ViewController2 {
//            print("Recived")
//        }
//    }
//    
//    
//}
//
