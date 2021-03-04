//
//  Array+Only..swift
//  Memorize
//
//  Created by 许宝吉 on 2021/3/1.
//

import Foundation

// 针对所有Array的extension

extension Array {
    var only: Element?{
        count == 1 ? first : nil // 省略了return
    }
}
