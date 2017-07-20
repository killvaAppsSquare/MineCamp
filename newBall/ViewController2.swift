//
//  ViewController2.swift
//  newBall
//
//  Created by Macbook Pro on 7/9/17.
//  Copyright © 2017 Macbook Pro. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
        performSegue(withIdentifier: "goBack", sender: self)

    }
         // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goBack" {
            let vc = segue.destination as? ViewController
            
            vc?.lazyme = "Arafa"
        }
    }
 
}
