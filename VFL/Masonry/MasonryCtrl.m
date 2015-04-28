//
//  MasonryCtrl.m
//  VFL
//
//  Created by xserver on 15/4/27.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//
//  代码只要来至 masonry example.


#import "MasonryCtrl.h"
#import "MasonryBasicView.h"
//#import "<#header#>"

@interface MasonryCtrl ()

@end

@implementation MasonryCtrl
- (void)loadView {
    self.view = [[MasonryBasicView alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#ifdef __IPHONE_7_0
- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}
#endif
@end
