//
//  CGPoint+Operator.swift
//  GlobalMouseEventDemo
//
//  Created by HIROKI IKEUCHI on 2023/07/23.
//

import Foundation

// MARK: - CGPoint

extension CGPoint {
    static func + (l: CGPoint, r: CGPoint) -> CGPoint {
        CGPoint(x: l.x + r.x, y: l.y + r.y)
    }
    
    static func - (l: CGPoint, r: CGPoint) -> CGPoint {
        CGPoint(x: l.x - r.x, y: l.y - r.y)
    }
    
    static func * (l: CGFloat, r: CGPoint) -> CGPoint {
        CGPoint(x: l * r.x, y: l * r.y)
    }
    
    static func / (l: CGPoint, r: CGFloat) -> CGPoint {
        if r == 0.0 {
            return CGPoint.zero
        }
        return CGPoint(x: l.x / r, y: l.y / r)
    }
    
    static func += (lhs: inout CGPoint, rhs: CGPoint) {
        lhs.x += rhs.x
        lhs.y += rhs.y
    }
    
    static func -= (lhs: inout CGPoint, rhs: CGPoint) {
        lhs.x -= rhs.x
        lhs.y -= rhs.y
    }
}

// MARK: - CGRect

extension CGRect {
    static func * (l: CGFloat, r: CGRect) -> CGRect {
        CGRect(x: l * r.origin.x, y: l * r.origin.y, width: l * r.width, height: l * r.height)
    }
}

// MARK: - CGSize

extension CGSize {
    static func + (l: CGSize, r: CGSize) -> CGSize {
        CGSize(width: l.width + r.width, height: l.height + r.height)
    }
    
    static func * (l: CGFloat, r: CGSize) -> CGSize {
        CGSize(width: l * r.width, height: l * r.height)
    }
    
    static func += (lhs: inout CGSize, rhs: CGSize) {
        lhs = .init(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
}
