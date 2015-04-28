//
//  MasonryDatumLineView.m
//  VFL
//
//  Created by xserver on 15/4/28.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import "MasonryDatumLineView.h"
#import "MasonryHelper.h"

@implementation MasonryDatumLineView

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    UIView *redView = UIViewWithColor(UIColor.redColor);
    [self addSubview:redView];
    
//    UIView *blueView = UIViewWithColor(UIColor.blueColor);
//    [self addSubview:blueView];
//
//    UIView *greenView = UIViewWithColor(UIColor.greenColor);
//    [self addSubview:greenView];
    
    
    UIView *superview = self;
    int padding = 10;
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.equalTo(20);
        make.width.equalTo(100);
        
        make.baseline.offset(-44);  //  底线 y = superview.height
//        make.baseline.equalTo(superview.centerY);
    }];
    
//    [greenView makeConstraints:^(MASConstraintMaker *make) {
//
//    }];

//    [blueView makeConstraints:^(MASConstraintMaker *make) {
//        //  #   center = X + Y
//        make.center.equalTo(CGPointMake(0, 0));
//        //        make.centerX.centerY.equalTo(0);
//        make.width.height.equalTo(200);
//    }];
    
    return self;
}

@end
