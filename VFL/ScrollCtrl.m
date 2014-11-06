//
//  ScrollCtrl.m
//  VFL
//
//  Created by xserver on 14/11/4.
//  Copyright (c) 2014年 pitaya. All rights reserved.
//

#import "ScrollCtrl.h"

@interface ScrollCtrl ()

@end

@implementation ScrollCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self MixedApproach];
    
//    [self PureAutoLayoutApproach];

}
- (void)MixedApproach {
    CGFloat contentWidth = 300;
    CGFloat contentHeight = 400;
    
    
    UIView *contentView;
    contentView = [[UIView alloc] initWithFrame:CGRectMake(0,0,contentWidth,contentHeight)];
    contentView.backgroundColor = [UIColor greenColor];
    
    
    UIScrollView *scrollView;
    UIImageView *imageView;
    scrollView  = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, contentWidth, contentHeight)];
    [scrollView addSubview:contentView];
    
    // DON'T change contentView's translatesAutoresizingMaskIntoConstraints,
    // which defaults to YES;
    
    // Set the content size of the scroll view to match the size of the content view:
    [scrollView setContentSize:CGSizeMake(contentWidth+20,contentHeight+20)];
    
    /* the rest of your code here... */
    [self.view addSubview:scrollView];
}

- (void)PureAutoLayoutApproach {
    
    UIScrollView *scrollView;
    UIImageView *imageView;
    NSDictionary *viewsDictionary;
    
    // Create the scroll view and the image view.
    scrollView  = [[UIScrollView alloc] init];
    imageView = [[UIImageView alloc] init];
    
    // Add an image to the image view.
    [imageView setImage:[UIImage imageNamed:@"mm.jpg"]];
    
    // Add the scroll view to our view.
    [self.view addSubview:scrollView];
    
    // Add the image view to the scroll view.
    [scrollView addSubview:imageView];
    
    // Set the translatesAutoresizingMaskIntoConstraints to NO so that the views autoresizing mask is not translated into auto layout constraints.
    scrollView.translatesAutoresizingMaskIntoConstraints  = NO;
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Set the constraints for the scroll view and the image view.
    viewsDictionary = NSDictionaryOfVariableBindings(scrollView, imageView);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollView]|" options:0 metrics: 0 views:viewsDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|" options:0 metrics: 0 views:viewsDictionary]];
    [scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView]|" options:0 metrics: 0 views:viewsDictionary]];
    [scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView]|" options:0 metrics: 0 views:viewsDictionary]];
    
    /* the rest of your code here... */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
