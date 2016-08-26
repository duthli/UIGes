//
//  view.swift
//  UIGestureRecognizer
//
//  Created by do duy hung on 26/08/2016.
//  Copyright © 2016 do duy hung. All rights reserved.
//

import UIKit
class Item: UIImageView,UIGestureRecognizerDelegate
{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    func setup(){
        self.userInteractionEnabled = true
        self.multipleTouchEnabled = true
        
        let panGesture = UIPanGestureRecognizer(target: self,action: #selector(createpan))
        self.addGestureRecognizer(panGesture)
        
        let pinch = UIPinchGestureRecognizer(target: self,action: #selector(pinchPhoto))
        self.addGestureRecognizer(pinch)
        
        let rotate = UIRotationGestureRecognizer(target:self,action: #selector(rotatepic))
        rotate.delegate = self
        self.addGestureRecognizer(rotate)
    }
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true;
    }
    func createpan(panGesture : UIPanGestureRecognizer){
        if (panGesture.state == .Began || panGesture.state == .Changed){
            let point = panGesture.locationInView(self.superview)
            self.center = point
        }
    }
    func pinchPhoto(pinchGes:UIPinchGestureRecognizer){
        
        if let view = pinchGes.view{
            
            view.transform = CGAffineTransformScale(view.transform, pinchGes.scale, pinchGes.scale)
            
            pinchGes.scale = 1
        }
    }
    func rotatepic(ropic: UIRotationGestureRecognizer){
        if let view = ropic.view{
            view.transform = CGAffineTransformRotate(view.transform, ropic.rotation)
            ropic.rotation = 0;
            
        }
    }
}