//
//  Item.swift
//  Xmas2 Pinch Rotate Version 1.2
//
//  Created by Viet Anh Doan on 6/11/17.
//  Copyright © 2017 Viet. All rights reserved.
//

import UIKit
class Item: UIImageView,UIGestureRecognizerDelegate {
    func onPan(panGesture: UIPanGestureRecognizer) -> Void {
        if panGesture.state == .changed || panGesture.state == .began {
            center = panGesture.location(in: superview)
        }
    }
    func onPinch(pinchGesture: UIPinchGestureRecognizer) -> Void {
        if let view = pinchGesture.view {
            view.transform = view.transform.scaledBy(x: pinchGesture.scale, y: pinchGesture.scale)
        }
        pinchGesture.scale = 1
    }
    func onRotate(rotateGesture: UIRotationGestureRecognizer) -> Void {
        if let view = rotateGesture.view {
            view.transform = view.transform.rotated(by: rotateGesture.rotation)
        }
        rotateGesture.rotation = 0
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    func setup() -> Void {
        isMultipleTouchEnabled = true
        isUserInteractionEnabled = true
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(onPan))
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(onPinch))
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(onRotate))
        self.addGestureRecognizer(panGesture)
        self.addGestureRecognizer(pinchGesture)
        self.addGestureRecognizer(rotateGesture)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
}
