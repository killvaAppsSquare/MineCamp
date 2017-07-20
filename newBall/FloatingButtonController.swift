//
//  tws.swift
//  newBall
//
//  Created by Macbook Pro on 7/19/17.
//  Copyright © 2017 Macbook Pro. All rights reserved.
//

import Foundation
import UIKit

class FloatingButtonController: UIViewController {
    
    fileprivate(set) var button: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        window.windowLevel = CGFloat.greatestFiniteMagnitude
        window.isHidden = false
        window.rootViewController = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(FloatingButtonController.keyboardDidShow(_:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
    }
    
    fileprivate let window = FloatingButtonWindow()
    
    override func loadView() {
        let view = UIView()
        let button = UIButton(type: .custom)
        button.setTitle("Floating", for: UIControlState())
        button.setTitleColor(UIColor.green, for: UIControlState())
        button.backgroundColor = UIColor.white
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 3
        button.layer.shadowOpacity = 0.8
        button.layer.shadowOffset = CGSize.zero
        button.sizeToFit()
        button.frame = CGRect(origin: CGPoint(x: 10, y: 10), size: button.bounds.size)
        button.autoresizingMask = []
        view.addSubview(button)
        self.view = view
        self.button = button
        window.button = button
        
        let panner = UIPanGestureRecognizer(target: self, action: #selector(FloatingButtonController.panDidFire(_:)))
        button.addGestureRecognizer(panner)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        snapButtonToSocket()
    }
    
    func panDidFire(_ panner: UIPanGestureRecognizer) {
        let offset = panner.translation(in: view)
        panner.setTranslation(CGPoint.zero, in: view)
        var center = button.center
        center.x += offset.x
        center.y += offset.y
        button.center = center
        
        if panner.state == .ended || panner.state == .cancelled {
            UIView.animate(withDuration: 0.3, animations: {
                self.snapButtonToSocket()
            }) 
        }
    }
    
    func keyboardDidShow(_ note: Notification) {
        window.windowLevel = 0
        window.windowLevel = CGFloat.greatestFiniteMagnitude
    }
    
    fileprivate func snapButtonToSocket() {
        var bestSocket = CGPoint.zero
        var distanceToBestSocket = CGFloat.infinity
        let center = button.center
        for socket in sockets {
            let distance = hypot(center.x - socket.x, center.y - socket.y)
            if distance < distanceToBestSocket {
                distanceToBestSocket = distance
                bestSocket = socket
            }
        }
        button.center = bestSocket
    }
    
    fileprivate var sockets: [CGPoint] {
        let buttonSize = button.bounds.size
        let rect = view.bounds.insetBy(dx: 4 + buttonSize.width / 2, dy: 4 + buttonSize.height / 2)
        let sockets: [CGPoint] = [
            CGPoint(x: rect.minX, y: rect.minY),
            CGPoint(x: rect.minX, y: rect.maxY),
            CGPoint(x: rect.maxX, y: rect.minY),
            CGPoint(x: rect.maxX, y: rect.maxY),
            CGPoint(x: rect.midX, y: rect.midY)
        ]
        return sockets
    }
    
}

private class FloatingButtonWindow: UIWindow {
    
    var button: UIButton?
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        guard let button = button else { return false }
        let buttonPoint = convert(point, to: button)
        return button.point(inside: buttonPoint, with: event)
    }
    
}
