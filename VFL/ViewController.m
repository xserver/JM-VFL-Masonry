//
//  ViewController.m
//  VFL
//
//  Created by xserver on 14/11/4.
//  Copyright (c) 2014年 pitaya. All rights reserved.
//

#import "ViewController.h"
#import "ScrollCtrl.h"

@interface ViewController ()
@property (strong, nonatomic) UIView *blue;
@property (weak, nonatomic) IBOutlet UIView *green;
@property (weak, nonatomic) IBOutlet UIView *red;
@property (weak, nonatomic) IBOutlet UIView *purple;

@end

@implementation ViewController

/*
 --默认
    默认是 H 水平    Horizontal
    可选是 V 垂直    Vertical
 
    -  表示 8pt 分割 Standard Space     a b 之间 8pt     |[a_view]-[b_view]|
    () 圆括号内表示数值
    [] 方括号内表示视图
 
 --方向
    垂直方向    V:[a_view]-10-[b_view]
 
 --与父视图
    与父关系    |-50-[purpleBox]-50-|       Connection to Superview
 
 --自身
    大小     [button(>=50)]  [button(>=70,<=100)]
            [button(100@20)]    //  20 是 priority
 
 --两两
     两两紧贴    [a_view][b_view]
     两两相等    [a_view(==b_view)]  //  貌似带方向
 
 --举例
    @"H:|-20-[blue(>=200)]|     贴到 | 父视图的边上
    @"H:|-20-[blue(>=200)]      不会
 
 
 左、中、右对齐
 大小相等
 在some view 之后
 
 */

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self blueCode];
    [self greenFull];
    [self yellowFollowRedAndCenterX];
    
    [self grayAlignBlueLeft];
    
    [self brownInRed];
    
    [self orangeRatioRed];
}

#pragma mark 手写视图添加 VFL
- (void)blueCode {
    
    _blue = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    _blue.backgroundColor = [UIColor blueColor];
    _blue.translatesAutoresizingMaskIntoConstraints = NO;   //  手码的，要去掉 autoresizing
    [self.view addSubview:_blue];
    
    _blue.userInteractionEnabled = YES;
    [_blue addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(push)]];
    
    
    NSDictionary *views = @{@"blue"     :_blue,};
    NSString *vf;
    NSArray *lcArray;
    
    vf = @"H:|-20-[blue(60)]";
//    vf = @"H:|-20-[blue]|";
//    vf = @"H:[blue(200)]";
    lcArray = [NSLayoutConstraint constraintsWithVisualFormat:vf
                                                 options:0
                                                 metrics:nil
                                                   views:views];
    [self.view addConstraints:lcArray];
    
    vf = @"V:|-20-[blue]-100-|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vf
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
}

#pragma mark IB 的视图冲突 & 简单全屏
- (void)greenFull {
    
    NSDictionary *views = @{@"green"    :_green};

    //  单独移除某个 item 的 constraint. gree，使之变大
    //    [self.view removeConstraints:self.view.constraints];
    for (NSLayoutConstraint *lc in self.view.constraints) {
        if (lc.firstItem == _green) {
            [self.view removeConstraint:lc];
        }
    }
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[green]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[green]|" options:0 metrics:nil views:views]];

    return;
}

#pragma mark 水平居中 & 在某视图下面
- (void)yellowFollowRedAndCenterX {
    
    UIView *yeview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    yeview.backgroundColor = [UIColor yellowColor];
    yeview.translatesAutoresizingMaskIntoConstraints = NO;   //  手码的，要去掉 autoresizing
    [self.view addSubview:yeview];
    
    NSDictionary *views = @{@"yellow": yeview ,
                            @"red" : _red};

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[red]-20-[yellow(==red)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[yellow(==red)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
    NSLayoutConstraint *lc = [NSLayoutConstraint constraintWithItem:yeview        // view1
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view    //  view 2
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:2            // view2.centerX * multiplier
                                                           constant:-self.view.bounds.size.width/2];
                                                        //  multiplier 和 constant 这里故意相互抵消了
    [self.view addConstraint:lc];
    
    //  "view1.attr1 = view2.attr2 * multiplier + constant"
}

#pragma mark 和某视图左对齐
- (void)grayAlignBlueLeft {
    
    UIView *grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    grayView.backgroundColor = [UIColor grayColor];
    grayView.translatesAutoresizingMaskIntoConstraints = NO;   //  手码的，要去掉 autoresizing
    [self.view addSubview:grayView];
    
    NSDictionary *views = @{@"gray": grayView ,
                            @"blue" : _blue,
                            @"red" : _red};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[red]-140-[gray(==red)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];

    NSString *H = @"H:[gray(==red)]";
//    NSString *H = @"H:[gray(red)]";
//    NSString *H = @"H:[gray(red/2)]";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:H
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
//    gray 的 right 和 blue left 偏移 2
//    NSLayoutConstraint *lc = [NSLayoutConstraint constraintWithItem:grayView
//                                                          attribute:NSLayoutAttributeRight
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:_blue
//                                                          attribute:NSLayoutAttributeLeft
//                                                         multiplier:1            // view2.centerX * multiplier
//                                                           constant:2];
//    [self.view addConstraint:lc];
    
//    gray 的 left 和 blue left 偏移 12
    NSLayoutConstraint *lc = [NSLayoutConstraint constraintWithItem:grayView
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_blue
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1            // view2.centerX * multiplier
                                                           constant:12];
    [self.view addConstraint:lc];

}

#pragma mark 子视图叠加
- (void)brownInRed {
    
    UIView *brown = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    brown.backgroundColor = [UIColor brownColor];
    brown.translatesAutoresizingMaskIntoConstraints = NO;
    [_red addSubview:brown];
    
    NSDictionary *views = @{@"brown": brown ,
                            @"red" : _red};
    
    [_red addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[brown(30)]"
                                                               options:0
                                                               metrics:nil
                                                                  views:views]];
    [_red addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[brown(30)]"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views]];
}

#pragma mark 高宽比例 ratio
- (void)orangeRatioRed {
    
    UIView *orange = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    orange.backgroundColor = [UIColor orangeColor];
    orange.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:orange];
    
    
    NSDictionary *views = @{@"orange": orange ,
                            @"red" : _red};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[red]-160-[orange(>=50)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[orange(>=50)]"
                                                                      options:NSLayoutFormatAlignAllLeft
                                                                      metrics:nil
                                                                        views:views]];
    
    NSLayoutConstraint *lc;
//    他人的倍数
//    lc = [NSLayoutConstraint constraintWithItem:orange
//                                      attribute:NSLayoutAttributeWidth
//                                      relatedBy:NSLayoutRelationEqual
//                                         toItem:_red
//                                      attribute:NSLayoutAttributeWidth
//                                     multiplier:2
//                                       constant:0];
//    [self.view addConstraint:lc];
//    
//    lc = [NSLayoutConstraint constraintWithItem:orange
//                                      attribute:NSLayoutAttributeHeight
//                                      relatedBy:NSLayoutRelationEqual
//                                         toItem:_red
//                                      attribute:NSLayoutAttributeHeight
//                                     multiplier:0.5
//                                       constant:0];
//    [self.view addConstraint:lc];
    
    //  自己的倍数
    lc = [NSLayoutConstraint constraintWithItem:orange
                                      attribute:NSLayoutAttributeWidth
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:orange
                                      attribute:NSLayoutAttributeHeight
                                     multiplier:4
                                       constant:0];
    [self.view addConstraint:lc];
    
}

- (void)push {
    ScrollCtrl *sc = [[ScrollCtrl alloc] initWithNibName:@"ScrollCtrl" bundle:nil];
    [self presentViewController:sc animated:YES completion:nil];
}

@end
