//
//  MaskViewController.swift
//  CECustomeSegmentControl
//
//  Created by Mr.LuDashi on 16/7/11.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

import UIKit

let GrayImageName = "jobs_gray"
let ColorImageName = "jobs_color"
let MaskImageName = "mask_image"

class MaskViewController: UIViewController {
    
    var grayImageView: UIImageView!
    var colorImageView: UIImageView!
    var maskImage: UIImage!
    
    var maskLayer: CALayer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addGrayImageView()
        addColorImageView()
        addMaskLayer()
    }
    
    func addGrayImageView() {
        grayImageView = UIImageView(frame: self.view.bounds)
        self.addImageView(grayImageView, imageName: GrayImageName)
    }
    
    func addColorImageView() {
        colorImageView = UIImageView(frame: self.view.bounds)
        self.addImageView(colorImageView, imageName: ColorImageName)
    }
    
    func addImageView(imageView: UIImageView, imageName: String) {
        imageView.contentMode = .ScaleAspectFill
        imageView.image = UIImage(named: imageName)
        self.view.addSubview(imageView)
    }
    
    
    func  addMaskLayer() {
        maskImage = UIImage(named: MaskImageName)
        maskLayer = CALayer()
        maskLayer.frame = CGRect(origin: CGPointZero, size: maskImage.size)
        //maskLayer.backgroundColor = UIColor.blackColor().CGColor      //使用背景色
        maskLayer.contents = maskImage!.CGImage                         //使用图片填充
        maskLayer.position = view.center
        colorImageView.layer.mask = maskLayer
    }
    

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touche in touches {
            CATransaction.setDisableActions(true)
            maskLayer?.position = touche.locationInView(self.view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
