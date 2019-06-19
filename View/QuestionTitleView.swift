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
    
    var id: Int?
    var viewController: QuestionViewController?
    
    lazy var titleLabel: UILabel = {
        let v = UILabel()
        v.numberOfLines = 0
        v.text = "質問1:お腹すいてますか?"
        v.font = UIFont(name: "GillSans-UltraBold", size: 28)
        addSubview(v)
        return v
    }()
    
//    lazy var descriptionLabel: UILabel = {
//        let v = UILabel()
//        v.numberOfLines = 0
//        v.font = UIFont(name: "GillSans", size: 26)
//        addSubview(v)
//        return v
//    }()
//
    lazy var commentLabel: UILabel = {
        let v = UILabel()
        v.numberOfLines = 0
        v.font = UIFont(name: "GillSans", size: 22)
        addSubview(v)
        return v
    }()
    
    lazy var imageView: UIImageView = {
        let v = UIImageView(image: UIImage(named: "mask_animal_kuma"))
//        v.backgroundColor = UIColor(hex: "F3AFF8")
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

    }
    
    func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(140)
        }
//        descriptionLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(titleLabel.snp.top).offset(40)
//        }
        commentLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        imageView.snp.makeConstraints { make in
            make.size.equalTo(160)
            make.centerX.equalToSuperview()
            make.top.equalTo(commentLabel.snp.bottom).offset(80)
        }
    }
}