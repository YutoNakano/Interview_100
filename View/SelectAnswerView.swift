//
//  SelectButtonView.swift
//  kokoroAppiOS
//
//  Created by 中野湧仁 on 2019/06/16.
//  Copyright © 2019 中野湧仁. All rights reserved.
//

import SnapKit
import UIKit


protocol SelectAnserViewDelegate: class {
    func getQuestionNumber(number: Int)
}

final class SelectAnserView: UIView {

    lazy var goButton: UIButton = {
        let v = UIButton()
        v.setTitle("次へ", for: .normal)
        v.setTitleColor(UIColor.white, for: .normal)
        v.titleLabel?.font = UIFont(name: "GillSans-UltraBold", size: 20)
        v.backgroundColor = UIColor.appColor(.yesPink)
        v.addTarget(self, action: #selector(goButtonTapped), for: .touchUpInside)
        v.layer.cornerRadius = 15
        addSubview(v)
        return v
    }()

    lazy var backButton: UIButton = {
        let v = UIButton()
        v.setTitle("TOPに戻る", for: .normal)
        v.setTitleColor(UIColor.white, for: .normal)
        v.titleLabel?.font = UIFont(name: "GillSans-UltraBold", size: 17)
        v.backgroundColor = UIColor.appColor(.noBlue)
        v.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        v.layer.cornerRadius = 15
        addSubview(v)
        return v
    }()

    var viewController: QuestionViewController?
    weak var delegate: SelectAnserViewDelegate?
    
    private var limitNumber: Int = 10
    private var count: Int = 0
    
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
    }

    func makeConstraints() {
        goButton.snp.makeConstraints { make in
            make.width.equalTo(140)
            make.height.equalTo(50)
            make.right.bottom.equalToSuperview().offset(-40)
        }
        backButton.snp.makeConstraints { make in
            make.width.equalTo(140)
            make.height.equalTo(50)
            make.left.equalToSuperview().offset(40)
            make.bottom.equalToSuperview().offset(-40)
        }
    }
}

extension SelectAnserView {
    @objc func goButtonTapped() {
        count += 1
        delegate?.getQuestionNumber(number: count)
        guard count <= limitNumber else {
         return
        }
        viewController?.reload()
    }
    @objc func backButtonTapped() {
        count = 0
        viewController?.navigationController?.popViewController(animated: true)
    }
}
