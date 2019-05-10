//
//  CoverLeadView.swift
//  ZeJiTiku
// 
//  Created by 泽稷 on 2018/8/6.
//  Copyright © 2018年 泽稷. All rights reserved.
//

import UIKit
import SnapKit

open class CoverLeadView: UIView {
    var imgArray:[String]?
    var rectArray:[CGRect]?
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dissmis))
        bgView.addGestureRecognizer(tap)
        bgView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
        }
        addSubview(imgView)
       
      
        
    }
  public  func reloadCoverImg(imgName:[String],rect:[CGRect])  {
        imgArray = imgName
        rectArray = rect
        if imgName.count >= 1{
            imgView.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(rect[0].origin.x)
                if #available(iOS 11.0, *) {
                    make.top.equalTo(self.safeAreaLayoutGuide).offset(rect[0].origin.y)
                } else {
                    make.top.equalToSuperview().offset(rect[0].origin.y)
                }
            }
            imgView.image = UIImage.init(named: imgName[0])
        }
       
    }
   public lazy var imgView: UIImageView = {
        let temp = UIImageView(frame: .zero)
//        temp.isUserInteractionEnabled = true
//        temp.contentMode = .scaleAspectFill
        return temp
    }()
  public  lazy var bgView: UIView = {
        let temp = UIView(frame: .zero)
        temp.backgroundColor = UIColor.black
        temp.alpha = 0.7
        return temp
    }()
    public  required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   public func show()  {
        let window = UIApplication.shared.keyWindow
        window?.addSubview(self)
        self.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
    }
    @objc public func dissmis()  {
        if (imgArray?.count)! > 0 {
            imgArray?.remove(at: 0)
            rectArray?.remove(at: 0)
            if (imgArray?.count)! >= 1{
                imgView.snp.remakeConstraints { (make) in
                    make.left.equalToSuperview().offset(rectArray![0].origin.x)
                    if #available(iOS 11.0, *) {
                        make.top.equalTo(self.safeAreaLayoutGuide).offset(rectArray![0].origin.y)
                    } else {
                        make.top.equalToSuperview().offset(rectArray![0].origin.y)
                    }
                }
                imgView.image = UIImage.init(named: imgArray![0])
            }
           
        }
        if imgArray?.count == 0 {
            self.removeFromSuperview()
        }
        
        
       
        
        
    }
 
}
