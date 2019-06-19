//
//  ViewController.swift
//  Interview100
//
//  Created by 中野湧仁 on 2019/06/19.
//  Copyright © 2019 中野湧仁. All rights reserved.
//

import UIKit
import FirebaseFirestore
import SnapKit

class ViewController: UIViewController {
    
    lazy var label: UILabel = {
        let v = UILabel()
        view.addSubview(v)
        return v
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        // Do any additional setup after loading the view.
        let db = Firestore.firestore()
        db.collection("Questions")
        .document("number1")
            .getDocument { (document, error ) in
        if let err = error {
            print(err)
        } else {
//            print("\(document?.documentID) => \(document!.data())")
            let text = document?.data()
            self.label.text = text?["title"] as? String
        }
    }
        
        makeConstraints()
}
    func makeConstraints() {
        label.snp.makeConstraints { make in
            make.size.equalTo(300)
            make.center.equalToSuperview()
        }
    }
    
    
    
    
}
