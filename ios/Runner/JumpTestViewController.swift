//
//  JumpTestViewController.swift
//  Runner
//
//  Created by dushiling on 2022/2/26.
//

import Foundation

class JumpTestViewController: UIViewController {
    
    lazy var testLabel: UILabel = {
        let label = UILabel()
        label.frame.size = CGSize(width: 300, height: 50)
        label.backgroundColor = UIColor.blue
        label.textColor = UIColor.white
        label.text = "原生界面"
        label.textAlignment = .center
        
        label.center.x = self.view.bounds.width/2
        label.center.y = self.view.bounds.height/2
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.view.addSubview(testLabel)
    }
    

}
