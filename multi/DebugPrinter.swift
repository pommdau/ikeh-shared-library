//
//  DebugPrinter.swift
//  TweetMuseum
//
//  Created by HIROKI IKEUCHI on 2022/06/20.
//

import Foundation


/// ref: [ResultBuilderを悪用してメソッドの返り値をプリントデバッグする便利なやつを作る](https://qiita.com/noppefoxwolf/items/26e140f874d79d52fb35)
/*
 Usage:

 @DebugPrinter
 func getCurrentUser() -> User {
   userRepository.getCurrent()
 }
 
 */
@resultBuilder
public struct DebugPrinter {
    public static func buildBlock<T: CustomDebugStringConvertible>(
        _ component: T,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) -> T {
        print(file, function, line, component.debugDescription)
        return component
    }
}

/// debug friendly print with a dog/cow.
/// ref: [Swift で便利なmyデバッグ関数](https://qiita.com/1024jp/items/9faa0bb6121cffcda7da)
/*
 Usage:
 moof("rect", rect)
 
 Result:
 🐕 drawBackground(in:) ["rect", (0.0, 0.0, 4.0, 4.0)]
 */
func moof(_ items: Any..., function: String = #function) {

    let icon = Thread.isMainThread ? "🐕" : "🐄"

    Swift.print(icon + " \(function) ", terminator: "")
    if items.isEmpty {
        Swift.print("")
    } else {
        Swift.debugPrint(items)
    }
}
