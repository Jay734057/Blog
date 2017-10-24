//
//  ViewController.m
//  Blog
//
//  Created by Jianyu ZHU on 24/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

UIButton *button;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview: [self button]];
    [button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [button.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    [button.widthAnchor constraintEqualToConstant:50].active = YES;
    [button.heightAnchor constraintEqualToConstant:50].active = YES;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIButton *) button {
    if (!button) {
        button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:@"test" forState: UIControlStateNormal];
        [button setBackgroundColor:[UIColor redColor]];
        [button addTarget:self action:@selector(presentNewView) forControlEvents:UIControlEventTouchUpInside];
        button.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return button;
}

-(void) presentNewView {
    UIViewController *newView = [[UIViewController alloc] init];
    newView.view.backgroundColor = [UIColor purpleColor];
    newView.view.userInteractionEnabled = YES;
//    [newView.view addGestureRecognizer:[[UIGestureRecognizer alloc] initWithTarget:self action:@selector(dismissAnimated:)]];
    [self presentViewController:newView animated:YES completion:nil];
}


@end
