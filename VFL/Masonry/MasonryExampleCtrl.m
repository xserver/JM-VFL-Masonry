//
//  MasonryExampleCtrl.m
//  VFL
//
//  Created by xserver on 15/4/28.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import "MasonryExampleCtrl.h"
@interface MasonryExampleCtrl ()

@property (nonatomic, copy) NSString *viewName;
@end

@implementation MasonryExampleCtrl
+ (instancetype)makeWithClassName:(NSString *)name {
    return [[MasonryExampleCtrl alloc] initWithViewName:name];
}

- (id)initWithViewName:(NSString *)viewName {
    if (self = [super init]) {
        self.viewName = viewName;
        self.title = viewName;
    }
    return self;
}

- (void)loadView {
    self.view = NSClassFromString(self.viewName).new;
    self.view.backgroundColor = [UIColor whiteColor];
}

#ifdef __IPHONE_7_0
- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}
#endif

@end
