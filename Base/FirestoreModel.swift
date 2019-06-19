//
//  FirestoreModel.swift
//  Interview100
//
//  Created by 中野湧仁 on 2019/06/19.
//  Copyright © 2019 中野湧仁. All rights reserved.
//

import FirebaseFirestore

protocol FirestoreModel {
    
}

struct Documents<T: FirestoreModel> {
    var id: String {
        return ref.documentID
    }
    let ref: DocumentReference
    let data: T
}

struct Question: FirestoreModel{
    let number1: String
}
