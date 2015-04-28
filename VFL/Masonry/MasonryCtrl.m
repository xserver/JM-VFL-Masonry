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
#import "MasonryExampleCtrl.h"

@interface MasonryCtrl ()
@property (nonatomic, strong) UITableView *tab;
@property (nonatomic, strong) NSArray *list;
@end

@implementation MasonryCtrl

//- (void)loadView {
//    self.view = [[MasonryBasicView alloc] init];
//    self.view.backgroundColor = [UIColor whiteColor];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _list = @[
              @"MasonryBasicView",
              @"MasonryDatumLineView"
              ];
    
    [self.view addSubview:self.tab];
}

#ifdef __IPHONE_7_0
- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}
#endif



#pragma mark - Create Table
- (UITableView *)tab {
    if (_tab == nil) {
        CGRect frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
        _tab = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tab.dataSource = self;
        _tab.delegate = self;
    }
    
    return _tab;
}


#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"MasonryCatalogCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [_list objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *name = [_list objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:[MasonryExampleCtrl makeWithClassName:name] animated:YES];

}

@end
