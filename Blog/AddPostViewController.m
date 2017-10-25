//
//  AddPostViewController.m
//  Blog
//
//  Created by Jianyu ZHU on 24/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import "AddPostViewController.h"
#import "UIColor+Helpers.h"
#import "DataService.h"

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
        [postImg addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleImgPick)]];
    }
    
    return postImg;
}

UITextField *titleLbl;

-(UITextField *) titleLabel {
    titleLbl = [[UITextField alloc]init];
    
    if (titleLbl) {
        titleLbl.translatesAutoresizingMaskIntoConstraints = NO;
        titleLbl.placeholder = @"Enter Title";
        titleLbl.font = [UIFont fontWithName:@"Helvetica Neue" size:18];
        titleLbl.textColor = [UIColor colorWithRed:85 Green:85 Blue:85];
        titleLbl.minimumFontSize = 17;
        titleLbl.adjustsFontSizeToFitWidth = YES;
        titleLbl.textAlignment = NSTextAlignmentCenter;
        titleLbl.borderStyle = UITextBorderStyleRoundedRect;
        titleLbl.backgroundColor = [UIColor clearColor];
        titleLbl.contentMode = UIViewContentModeScaleToFill;
    }
    
    return titleLbl;
}

UITextView *descLbl;

-(UITextView *) descLabel {
    descLbl = [[UITextView alloc]init];
    
    if (descLbl) {
        descLbl.translatesAutoresizingMaskIntoConstraints = NO;
        descLbl.text = @"";
        descLbl.font = [UIFont fontWithName:@"Helvetica Neue" size:18];
        descLbl.backgroundColor = [UIColor clearColor];
        descLbl.layer.borderWidth = 0.5f;
        descLbl.layer.borderColor = [[UIColor colorWithRed:204 Green:204 Blue:204] CGColor];
        descLbl.layer.cornerRadius = 6;
        descLbl.contentMode = UIViewContentModeScaleToFill;
        descLbl.delegate = self;
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
        [postBtn.titleLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:20]];
        postBtn.layer.cornerRadius = 6;
        [postBtn addTarget:self action:@selector(handlePost) forControlEvents:UIControlEventTouchUpInside];
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
        [cancelBtn.titleLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:18]];
        [cancelBtn addTarget:self action:@selector(handleCancelBtnPress) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return cancelBtn;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.delegate = self;
    
    [self.view addSubview:[self topContainer]];
    [self setupTopContainer];
    
    [self.view addSubview:[self postImg]];
    [self.view addSubview:[self titleLabel]];
    [self.view addSubview:[self descLabel]];
    [self.view addSubview:[self postBtn]];
    [self setupMainView];
    [self setupPlaceholder];
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
    [postImg.widthAnchor constraintEqualToConstant:self.view.frame.size.width * 0.6].active = YES;
    [postImg.heightAnchor constraintEqualToAnchor:postImg.widthAnchor multiplier:1].active = YES;
    [postImg.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    
    [titleLbl.topAnchor constraintEqualToAnchor:postImg.bottomAnchor constant:25].active = YES;
    [titleLbl.heightAnchor constraintEqualToConstant:36].active = YES;
    [titleLbl.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant: 28].active = YES;
    [titleLbl.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant: -28].active = YES;

    [postBtn.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-20].active = YES;
    [postBtn.heightAnchor constraintEqualToConstant:38].active = YES;
    [postBtn.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant: 28].active = YES;
    [postBtn.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant: -28].active = YES;
    
    [descLbl.topAnchor constraintEqualToAnchor:titleLbl.bottomAnchor constant:20].active = YES;
    [descLbl.bottomAnchor constraintEqualToAnchor:postBtn.topAnchor constant:-20].active = YES;
    [descLbl.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant: 28].active = YES;
    [descLbl.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant: -28].active = YES;

}

UILabel *placeholderLabel;

-(void)setupPlaceholder {
    placeholderLabel = [[UILabel alloc] init];
    placeholderLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [placeholderLabel setText:@"Enter Description"];
    [placeholderLabel setBackgroundColor:[UIColor clearColor]];
    [placeholderLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:18]];
    [placeholderLabel setTextColor:[UIColor colorWithRed:204 Green:204 Blue:204]];
    
    [descLbl addSubview:placeholderLabel];
    [placeholderLabel.topAnchor constraintEqualToAnchor:descLbl.topAnchor constant:1].active = YES;
    [placeholderLabel.heightAnchor constraintEqualToConstant:36].active = YES;
    [placeholderLabel.leftAnchor constraintEqualToAnchor:descLbl.leftAnchor constant: 5].active = YES;
    [placeholderLabel.rightAnchor constraintEqualToAnchor:descLbl.rightAnchor constant: -28].active = YES;
}

-(void)textViewDidChange:(UITextView *)textView {
    if(![descLbl hasText]) {
        placeholderLabel.hidden = NO;
    } else if ([[descLbl subviews] containsObject:placeholderLabel]) {
        placeholderLabel.hidden = YES;
    }
}

-(void)textViewDidEndEditing:(UITextView *)textView {
    if (![textView hasText]) {
        placeholderLabel.hidden = NO;
    }
}

-(void) handleCancelBtnPress {
    [self dismissViewControllerAnimated:YES completion:nil];
}

UIImagePickerController *imagePicker;

-(void)handleImgPick {
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(void)handlePost {
    if(postImg.image && titleLbl.text && descLbl.text){
        NSString *imgPath = [[DataService instance] saveImageAndCreatePathWithImage:postImg.image];
        Post *post = [[Post alloc] initWithImagePath:imgPath Title:titleLbl.text Description:descLbl.text];
        [[DataService instance] addPost:post];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary<NSString *,id> *)editingInfo {
    [imagePicker dismissViewControllerAnimated:true completion:nil];
    postImg.image = image;
}


@end
