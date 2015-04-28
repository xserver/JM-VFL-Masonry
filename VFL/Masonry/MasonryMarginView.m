//
//  MasonryMarginView.m
//  VFL
//
//  Created by xserver on 15/4/28.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import "MasonryMarginView.h"
#import "MasonryHelper.h"

@implementation MasonryMarginView

//..  margin 被废了？
- (id)init {
    self = [super init];
    if (!self) return nil;
    
//    UIView *redView = UIViewWithColor(UIColor.redColor);
//    [self addSubview:redView];
//    
//    UIView *greenView = UIViewWithColor(UIColor.greenColor);
//    [self addSubview:greenView];
//    
//    
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.top.left.equalTo(20);
//        make.size.equalTo(CGSizeMake(200, 100));
//    }];
//    
//    [greenView makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(redView.topMargin);
//        make.bottom.equalTo(redView.bottomMargin);
//        make.left.equalTo(redView.leftMargin);
//        make.right.equalTo(redView.rightMargin);
//    }];
    
    return self;
}

@end
