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
    var id: Int?
    var questionTitle: String? {
        didSet {
            self.setModel()
        }
    }
    
    lazy var titleLabel: UILabel = {
        let v = UILabel()
        v.numberOfLines = 0
        v.text = "質問99:お腹すいてますか?"
        v.font = UIFont(name: "GillSans-UltraBold", size: 28)
        addSubview(v)
        return v
    }()
    
    lazy var commentLabel: UILabel = {
        let v = UILabel()
        v.numberOfLines = 0
        v.font = UIFont(name: "GillSans", size: 22)
        addSubview(v)
        return v
    }()
    
    var questionNumber: Int?
    
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
//        guard let numberText = questionNumber?.description else { return }
        guard let title = questionTitle else { return }
        guard let number = viewController?.questionNumber else { return }
        titleLabel.text = "質問\(number): \n\(title)"
    }
    
    func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.width.equalTo(screenWidth - 32)
            make.centerX.equalToSuperview()
            make.top.equalTo(140)
        }
        commentLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
//        imageView.snp.makeConstraints { make in
//            make.size.equalTo(250)
//            make.centerX.equalToSuperview()
//            make.top.equalTo(commentLabel.snp.bottom).offset(60)
//        }
    }
}

