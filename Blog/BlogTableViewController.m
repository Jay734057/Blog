//
//  BlogTableViewController.m
//  Blog
//
//  Created by Jianyu ZHU on 24/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import "BlogTableViewController.h"
#import "UIColor+Helpers.h"
#import "DataService.h"
#import "PostCell.h"
#import "AddPostViewController.h"

@interface BlogTableViewController()

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIButton *addPostBtn;
@property (nonatomic, strong) UITableView *tableView;

@end


@implementation BlogTableViewController

-(UIView *) topView {
    if (!_topView) {
        _topView = [[UIView alloc] init];
        _topView.translatesAutoresizingMaskIntoConstraints = NO;
        _topView.backgroundColor = [UIColor colorWithRed:61 Green:91 Blue:151];
        _topView.contentMode = UIViewContentModeScaleToFill;
    }
    return _topView;
}

-(UIButton *) postBtn {
   if (!_addPostBtn) {
        _addPostBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _addPostBtn.translatesAutoresizingMaskIntoConstraints = NO;
        [_addPostBtn setImage:[UIImage imageNamed:@"camera"] forState:UIControlStateNormal];
        _addPostBtn.contentMode = UIViewContentModeScaleToFill;
        [_addPostBtn addTarget:self action:@selector(handleAddBtnPress) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addPostBtn;
}

-(void)handleAddBtnPress {
    AddPostViewController *postViewController = [[AddPostViewController alloc]init];
    [self presentViewController:postViewController animated:YES completion:nil];
}

-(UITableView *) tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.topView];
    [self setupTopView];
    
    [self.view addSubview:self.tableView];
    [self setupTableView];
    
    [[DataService instance] loadPosts];
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(onPostsLoaded:) name:@"postsLoaded" object:nil];
}

-(void)onPostsLoaded: (NSObject *) notif{
    [self.tableView reloadData];
}

-(void)setupTopView {
    [self.topView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.topView.heightAnchor constraintEqualToConstant:64].active = YES;
    [self.topView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.topView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    
    [self.topView addSubview:self.postBtn];
    [self.addPostBtn.bottomAnchor constraintEqualToAnchor:self.topView.bottomAnchor constant:-8].active = YES;
    [self.addPostBtn.heightAnchor constraintEqualToConstant:32].active = YES;
    [self.addPostBtn.widthAnchor constraintEqualToConstant:40].active = YES;
    [self.addPostBtn.rightAnchor constraintEqualToAnchor:self.topView.rightAnchor constant:-8].active = YES;
}

-(void)setupTableView {
    [self.tableView.topAnchor constraintEqualToAnchor:self.topView.bottomAnchor constant: 2].active = YES;
    [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-2].active = YES;
    [self.tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.tableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[DataService instance] loadedPosts] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Post *post = [[DataService instance] loadedPosts][[indexPath row]];
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    if (!cell)
        cell = [[PostCell alloc] init];
    
    [cell configureCellWithPost:post];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 87.0;
}

@end
