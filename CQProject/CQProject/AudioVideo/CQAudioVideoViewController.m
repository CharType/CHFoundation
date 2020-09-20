//
//  CQAudioVideoViewController.m
//  CQProject
//
//  Created by CharType on 2020/9/19.
//  Copyright © 2020 CharType. All rights reserved.
//

#import "CQAudioVideoViewController.h"
#import "CQCameraViewController.h"

@interface CQAudioVideoViewController ()
@property (strong, nonatomic) RETableViewManager *tableManager;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) RETableViewSection *section;
@end

@implementation CQAudioVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"音视频";
    [self.tableManager addSection:self.section];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.width.height.equalTo(self.view);
    }];
    
    @weakify(self);
    RETableViewItem *iOSDecelopmentItem = [[RETableViewItem alloc] initWithTitle:@"相机"];
        iOSDecelopmentItem.selectionHandler = ^(RETableViewItem *item) {
        @strongify(self);
        item.selectionStyle = UITableViewCellSelectionStyleNone;
        CQCameraViewController *viewController = [[CQCameraViewController alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
    };
    [self.section addItem:iOSDecelopmentItem];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    }
    return _tableView;
}
- (RETableViewManager *)tableManager {
    if (!_tableManager) {
        _tableManager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];
    }
    return _tableManager;
}
- (RETableViewSection *)section {
    if (!_section) {
        _section = [[RETableViewSection alloc] init];
        _section.headerHeight = CGFLOAT_MIN;
        _section.footerHeight = CGFLOAT_MIN;
    }
    return _section;
}
@end