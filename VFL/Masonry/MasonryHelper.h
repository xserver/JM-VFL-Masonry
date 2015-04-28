//
//  MasonryHelper.h
//  VFL
//
//  Created by xserver on 15/4/28.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//
#import <UIKit/UIKit.h>

#ifndef VFL_MasonryHelper_h
#define VFL_MasonryHelper_h

CG_INLINE UIView*
UIViewWithColor(UIColor * color) {
    UIView *redView = UIView.new;
    redView.backgroundColor = color;
    redView.layer.borderColor = UIColor.blackColor.CGColor;
    redView.layer.borderWidth = 2;
    
    return redView;
}

#endif
