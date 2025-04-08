//
//  String+Error.swift
//  ErrorDemo
//
//  Created by HIROKI IKEUCHI on 2024/08/18.
//

import Foundation

/// 開発用途のError
/// Refs: [【Swift】開発中、とりあえず適当なエラーを投げたい…！ときのアイディア4選](https://zenn.dev/dena/articles/42a79c109fcdc6)
/*
 e.g.
 
 func someFunc() throws {
     if true {
         throw "エラーだよ"
     }
 }

 do {
     try someFunc()
 } catch {
     print(error) // エラーだよ
     print(error.localizedDescription) // エラーだよ
 }
 */
#if !(RELEASE) // 意図せずリリースビルドで使用されることがないようにする
extension String: @retroactive Error {}
extension String: @retroactive LocalizedError {
    public var errorDescription: String? { self }
}
#endif
