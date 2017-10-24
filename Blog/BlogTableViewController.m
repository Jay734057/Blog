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

@implementation BlogTableViewController

UIView *topView;

-(UIView *) topView {
    topView = [[UIView alloc] init];
    
    if (topView) {
        topView.translatesAutoresizingMaskIntoConstraints = NO;
        topView.backgroundColor = [UIColor colorWithRed:61 Green:91 Blue:151];
        topView.contentMode = UIViewContentModeScaleToFill;
    }
    
    return topView;
}

UIButton *addPostBtn;

-(UIButton *) postBtn {
    addPostBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (addPostBtn) {
        addPostBtn.translatesAutoresizingMaskIntoConstraints = NO;
        [addPostBtn setImage:[UIImage imageNamed:@"camera"] forState:UIControlStateNormal];
        addPostBtn.contentMode = UIViewContentModeScaleToFill;
        [addPostBtn addTarget:self action:@selector(handleAddBtnPress) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return addPostBtn;
}

-(void)handleAddBtnPress {
    AddPostViewController *postViewController = [[AddPostViewController alloc]init];
    [self presentViewController:postViewController animated:YES completion:nil];
}

UITableView *tableView;

-(UITableView *) tableView {
    tableView = [[UITableView alloc] init];
    
    if (tableView) {
        tableView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return tableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:[self topView]];
    [self setupTopView];
    
    [self.view addSubview:[self tableView]];
    [self setupTableView];
    tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupTopView {
    [topView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [topView.heightAnchor constraintEqualToConstant:64].active = YES;
    [topView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [topView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    
    [topView addSubview:[self postBtn]];
    [addPostBtn.bottomAnchor constraintEqualToAnchor:topView.bottomAnchor constant:-8].active = YES;
    [addPostBtn.heightAnchor constraintEqualToConstant:32].active = YES;
    [addPostBtn.widthAnchor constraintEqualToConstant:40].active = YES;
    [addPostBtn.rightAnchor constraintEqualToAnchor:topView.rightAnchor constant:-8].active = YES;
    

}

-(void)setupTableView {
    [tableView.topAnchor constraintEqualToAnchor:topView.bottomAnchor constant: 2].active = YES;
    [tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-2].active = YES;
    [tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [tableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[DataService instance] loadedPosts] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Post *post = [[DataService instance] loadedPosts][[indexPath row]];
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier: @"PostCell"];
    if (cell) {
        [cell configureCellWithPost:post];
    } else {
        cell = [[PostCell alloc] init];
    }
    
    [cell configureCellWithPost:post];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 87.0;
}


@end
