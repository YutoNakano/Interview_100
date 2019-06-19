//
//  QuestionTitleView.swift
//  kokoroAppiOS
//
//  Created by 中野湧仁 on 2019/06/16.
//  Copyright © 2019 中野湧仁. All rights reserved.
//

import SnapKit
import UIKit

final class QuestionContentView: UIView {
    
    let screenWidth = UIScreen.main.bounds.width
    var viewController: QuestionViewController?
    var questionTitle: String? {
        didSet {
            self.setModel()
        }
    }
    
    lazy var questionNumberLabel: UILabel = {
        let v = UILabel()
        v.numberOfLines = 0
        v.font = UIFont(name: "GillSans-UltraBold", size: 22)
        addSubview(v)
        return v
    }()
    
    lazy var questionTitleLabel: UILabel = {
        let v = UILabel()
        v.numberOfLines = 0
        v.text = "お腹すいてますか?"
        v.font = UIFont(name: "GillSans-UltraBold", size: 28)
        addSubview(v)
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        backgroundColor = UIColor.white
        setModel()
    }
    
    func setModel() {
        guard let number = viewController?.questionNumber else { return }
        questionNumberLabel.text = "質問\(number.description)"
        guard let title = questionTitle else { return }
        questionTitleLabel.text = title
    }
    
    func makeConstraints() {
        questionNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.width.equalTo(100)
            make.left.equalTo(18)
        }
        questionTitleLabel.snp.makeConstraints { make in
            make.width.equalTo(screenWidth - 32)
            make.centerX.equalToSuperview()
            make.top.equalTo(questionNumberLabel.snp.bottom).offset(20)
        }
    }
}

