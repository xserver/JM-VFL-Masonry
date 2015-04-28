//
//  MasonryView.m
//  VFL
//
//  Created by xserver on 15/4/28.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import "MasonryBasicView.h"
#import "MasonryHelper.h"

@implementation MasonryBasicView
/**
 top.left.bottom.right
 center.centerX.centerY
 
 edges
 
 width.height.size
 
 */
- (id)init {
    self = [super init];
    if (!self) return nil;
    
    UIView *redView = UIViewWithColor(UIColor.redColor);
    [self addSubview:redView];

    UIView *blueView = UIViewWithColor(UIColor.blueColor);
    [self addSubview:blueView];
    
    UIView *greenView = UIViewWithColor(UIColor.greenColor);
    //    [self sendSubviewToBack:greenView];   //  会导致错误
    [self addSubview:greenView];
    

    
    UIView *superview = self;
    int padding = 10;

    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(120);
        make.left.equalTo(superview.left).offset(padding);
        
        //  #   size = width + height.
        make.size.equalTo(CGSizeMake(200, 100));
    }];
    
    [greenView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(redView).insets(UIEdgeInsetsMake(30, 30, 20, 20));
    }];
    
    [blueView makeConstraints:^(MASConstraintMaker *make) {
        //  #   center = X + Y
        make.center.equalTo(CGPointMake(0, 0));
//        make.centerX.centerY.equalTo(0);
        make.width.height.equalTo(200);
    }];
    
    return self;
}

@end
