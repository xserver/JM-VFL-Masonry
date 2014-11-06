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
    大小      [button(>=50)]  [button(>=70,<=100)]
            [button(100@20)]    //  20 是 priority
 
 --两两
     两两紧贴    [a_view][b_view]
     两两相等    [a_view(==a_view)]  //  貌似带方向
 
 --举例
    @"H:|-20-[blue(>=200)]|     贴到 | 父视图的边上
    @"H:|-20-[blue(>=200)]      不会
 

 
 */

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //  手码的，要去掉 autoresizing
    _blue = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    _blue.backgroundColor = [UIColor blueColor];
    [_blue setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_blue];
    _blue.userInteractionEnabled = YES;
    [_blue addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(push)]];


    NSDictionary *views = @{@"blue"     :_blue,
                            @"green"    :_green,
                            @"red"      :_red};
    NSLog(@"\n%@  \n%@",self.view, views);
    
//    NSString *vf = @"H:|-20-[blue(100)]";
    NSString *vf = @"H:|-10-[blue]-|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vf
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:views]];

    NSLayoutConstraint *lc1 = [NSLayoutConstraint constraintWithItem:_blue
                                                           attribute:NSLayoutAttributeCenterX
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeCenterX
                                                          multiplier:1
                                                            constant:0];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[blue]-400-|"
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil views:views]];
    
//    NSLayoutConstraint *lc = [NSLayoutConstraint constraintWithItem:_blue attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:1.0];
//    [self.view addConstraint:lc];
//    
//    [NSLayoutConstraint constraintsWithVisualFormat:@"|-(>=20)-[view(==200)]-(>=20)-|"
//                                            options: NSLayoutFormatAlignAllCenterX | NSLayoutFormatAlignAllCenterY
//                                            metrics:nil
//                                              views:@{@"view" : view}];
    

    //  单独移除某个 item 的 constraint
//    [self.view removeConstraints:self.view.constraints];
    for (NSLayoutConstraint *lc in self.view.constraints) {
        if (lc.firstItem == _green) {
            [self.view removeConstraint:lc];
        }
    }

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[green]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[green]|" options:0 metrics:nil views:views]];


//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[red(<=200)]|" options:0 metrics:nil views:views]];
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[red(<=200)]|" options:0 metrics:nil views:views]];
}

- (void)setupViewConstraints {
    NSDictionary *views = @{@"blue": self.blue };
    [self.blue setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view removeConstraints:self.view.constraints];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[blue]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[blue]|" options:0 metrics:nil views:views]];
}

- (void)push {
    ScrollCtrl *sc = [[ScrollCtrl alloc] initWithNibName:@"ScrollCtrl" bundle:nil];
    [self presentViewController:sc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
