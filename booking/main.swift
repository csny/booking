//
//  main.swift
//  booking
//
//  Created by macbook on 2016/03/11.
//  Copyright © 2016年 macbook. All rights reserved.
//

import Foundation

// 標準入力の準備
extension String: CollectionType {}
func readInts() -> [Int] {
    return readLine()!.split(" ").map { Int($0)! }
}

// 標準入力されたデータの取り込み
let MAXNUM: Int = Int(readLine()!)!
let MYNUM: Int = Int(readLine()!)!
let myCollection :[Int] = readInts()
let SALENUM: Int = Int(readLine()!)!
let onsaleCollection :[Int] = readInts()

// 総当たりで検索して、なければwantsの後ろに挿入
var isOwned :Bool = false
var alreadySearch :[Int] = [Int](count:1001, repeatedValue:-10)
var wanted :[Int] = []
for onselement in onsaleCollection {
    // 検索済みなら割愛
    if (alreadySearch[onselement] == -10) {
        for myelement in myCollection {
            if (myelement == onselement) {
                isOwned = true
                break
            }
        }
        if ( isOwned == false) {
            wanted.insert(onselement, atIndex:wanted.count)
        }
        alreadySearch[onselement] = 1
    }
    isOwned = false
}

// 出力
if (wanted.count != 0) {
    // 昇順にソートしてスペース区切りに
    wanted.sortInPlace {$0 < $1}
    let ansFormat = wanted.map(String.init).joinWithSeparator(" ")
    print(ansFormat)
} else {
    print("None")
}