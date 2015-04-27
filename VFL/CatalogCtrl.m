//
//  CatalogCtrl.m
//  VFL
//
//  Created by xserver on 15/4/27.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import "CatalogCtrl.h"
#import "IBAutoLayoutCtrl.h"
#import "VFLCtrl.h"
#import "MasonryCtrl.h"

@interface CatalogCtrl ()

@end

@implementation CatalogCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)VFL:(id)sender {
    [self.navigationController pushViewController:VFLCtrl.new animated:YES];
}

- (IBAction)Masonry:(id)sender {
    [self.navigationController pushViewController:MasonryCtrl.new animated:YES];
}

- (IBAction)AutoLayout:(id)sender {
    [self.navigationController pushViewController:IBAutoLayoutCtrl.new animated:YES];
}

@end
