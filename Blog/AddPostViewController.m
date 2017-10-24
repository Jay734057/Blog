//
//  AddPostViewController.m
//  Blog
//
//  Created by Jianyu ZHU on 24/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import "AddPostViewController.h"
#import "UIColor+Helpers.h"

@interface AddPostViewController ()

@end

@implementation AddPostViewController

UIView *topContainer;

-(UIView *) topContainer {
    topContainer = [[UIView alloc] init];
    
    if (topContainer) {
        topContainer.translatesAutoresizingMaskIntoConstraints = NO;
        topContainer.backgroundColor = [UIColor colorWithRed:61 Green:91 Blue:151];
        topContainer.contentMode = UIViewContentModeScaleToFill;
    }
    
    return topContainer;
}


UIImageView *postImg;

-(UIImageView *) postImg {
    postImg = [[UIImageView alloc]init];
    
    if (postImg) {
        postImg.translatesAutoresizingMaskIntoConstraints = NO;
        postImg.backgroundColor = [UIColor clearColor];
        postImg.contentMode = UIViewContentModeScaleAspectFill;
        postImg.layer.cornerRadius = postImg.frame.size.width / 2;
        postImg.clipsToBounds = YES;
        postImg.userInteractionEnabled = YES;
        [postImg addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handlePickImg)]];
    }
    
    return postImg;
}

-(void)handlePickImg {
    NSLog(@"....");
}

UITextField *titleLbl;

-(UITextField *) titleLabel {
    titleLbl = [[UITextField alloc]init];
    
    if (titleLbl) {
        titleLbl.translatesAutoresizingMaskIntoConstraints = NO;
        titleLbl.placeholder = @"Enter Title";
        titleLbl.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
        titleLbl.textColor = [UIColor colorWithRed:85 Green:85 Blue:85];
        titleLbl.minimumFontSize = 17;
        titleLbl.adjustsFontSizeToFitWidth = YES;
        titleLbl.textAlignment = NSTextAlignmentCenter;
        titleLbl.borderStyle = UIButtonTypeRoundedRect;
        titleLbl.backgroundColor = [UIColor clearColor];
        titleLbl.contentMode = UIViewContentModeScaleToFill;
    }
    
    return titleLbl;
}

UITextField *descLbl;

-(UITextField *) descLabel {
    descLbl = [[UITextField alloc]init];
    
    if (descLbl) {
        descLbl.translatesAutoresizingMaskIntoConstraints = NO;
        descLbl.placeholder = @"Enter Title";
        descLbl.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
        descLbl.textColor = [UIColor colorWithRed:85 Green:85 Blue:85];
        descLbl.minimumFontSize = 17;
        descLbl.adjustsFontSizeToFitWidth = YES;
        descLbl.textAlignment = NSTextAlignmentCenter;
        descLbl.borderStyle = UIButtonTypeRoundedRect;
        descLbl.backgroundColor = [UIColor clearColor];
        descLbl.contentMode = UIViewContentModeScaleToFill;
    }
    
    return descLbl;
}

UIButton *postBtn;

-(UIButton *) postBtn {
    postBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    if (postBtn) {
        postBtn.translatesAutoresizingMaskIntoConstraints = NO;
        [postBtn setTitle:@"Make Post" forState:UIControlStateNormal];
        [postBtn setTintColor:[UIColor whiteColor]];
        [postBtn setBackgroundColor:[UIColor colorWithRed:61 Green:91 Blue:151]];
        [postBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [postBtn addTarget:self action:@selector(handleCancelBtnPress) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return postBtn;
}

UIButton *cancelBtn;

-(UIButton *) cancelBtn {
    cancelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    if (cancelBtn) {
        cancelBtn.translatesAutoresizingMaskIntoConstraints = NO;
        [cancelBtn setTitle:@"Cancel" forState:UIControlStateNormal];
        [cancelBtn setTintColor:[UIColor whiteColor]];
        [cancelBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:18]];
        [cancelBtn addTarget:self action:@selector(handleCancelBtnPress) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return cancelBtn;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:[self topContainer]];
    [self setupTopContainer];
    
    [self.view addSubview:[self postImg]];
    [self.view addSubview:[self titleLabel]];
    [self.view addSubview:[self descLabel]];
    [self.view addSubview:[self postBtn]];
    [self setupMainView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupTopContainer {
    [topContainer.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [topContainer.heightAnchor constraintEqualToConstant:64].active = YES;
    [topContainer.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [topContainer.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    
    [topContainer addSubview:[self cancelBtn]];
    [cancelBtn.bottomAnchor constraintEqualToAnchor:topContainer.bottomAnchor constant:-4].active = YES;
    [cancelBtn.heightAnchor constraintEqualToConstant:32].active = YES;
    [cancelBtn.widthAnchor constraintEqualToConstant:64].active = YES;
    [cancelBtn.leftAnchor constraintEqualToAnchor:topContainer.leftAnchor constant:8].active = YES;
    
    
}

-(void)setupMainView {
    [postImg.topAnchor constraintEqualToAnchor:topContainer.bottomAnchor constant:35].active = YES;
    [postImg.heightAnchor constraintEqualToConstant:240].active = YES;
    [postImg.widthAnchor constraintEqualToConstant:240].active = YES;
    [postImg.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    
    [titleLbl.topAnchor constraintEqualToAnchor:postImg.bottomAnchor constant:25].active = YES;
    [titleLbl.heightAnchor constraintEqualToConstant:30].active = YES;
    [titleLbl.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant: 20].active = YES;
    [titleLbl.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant: -20].active = YES;
    
    [descLbl.topAnchor constraintEqualToAnchor:titleLbl.bottomAnchor constant:20].active = YES;
    [descLbl.heightAnchor constraintEqualToConstant:30].active = YES;
    [descLbl.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant: 20].active = YES;
    [descLbl.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant: -20].active = YES;
    
    [postBtn.topAnchor constraintEqualToAnchor:descLbl.bottomAnchor constant:22].active = YES;
    [postBtn.heightAnchor constraintEqualToConstant:34].active = YES;
    [postBtn.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant: 20].active = YES;
    [postBtn.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant: -20].active = YES;

}

-(void) handleCancelBtnPress {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
