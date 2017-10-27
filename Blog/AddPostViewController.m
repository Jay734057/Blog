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

@property (nonatomic, strong) UIView *topContainer;
@property (nonatomic, strong) UIImageView *postImg;
@property (nonatomic, strong) UITextField *titleLbl;
@property (nonatomic, strong) UITextView *descLbl;
@property (nonatomic, strong) UIButton *postBtn;
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) UILabel *placeholderLabel;
@property (nonatomic, strong) UIImagePickerController *imagePicker;

@end

@implementation AddPostViewController


-(UIView *) topContainer {
    if (!_topContainer) {
        _topContainer = [[UIView alloc] init];
        _topContainer.translatesAutoresizingMaskIntoConstraints = NO;
        _topContainer.backgroundColor = [UIColor colorWithRed:61 Green:91 Blue:151];
        _topContainer.contentMode = UIViewContentModeScaleToFill;
    }
    return _topContainer;
}

-(UIImageView *) postImg {
    if (!_postImg) {
        _postImg = [[UIImageView alloc]init];
        _postImg.translatesAutoresizingMaskIntoConstraints = NO;
        _postImg.backgroundColor = [UIColor clearColor];
        _postImg.contentMode = UIViewContentModeScaleAspectFill;
        _postImg.layer.cornerRadius = _postImg.frame.size.width / 2;
        _postImg.clipsToBounds = YES;
        _postImg.userInteractionEnabled = YES;
        _postImg.layer.borderWidth = 0.5f;
        _postImg.layer.borderColor = [[UIColor colorWithRed:204 Green:204 Blue:204] CGColor];
        _postImg.layer.cornerRadius = 6;
        [_postImg addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleImgPick)]];
    }
    return _postImg;
}

-(UITextField *) titleLbl {
    if (!_titleLbl) {
        _titleLbl = [[UITextField alloc]init];
        _titleLbl.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLbl.placeholder = @"Enter Title";
        _titleLbl.font = [UIFont fontWithName:@"Helvetica Neue" size:18];
        _titleLbl.textColor = [UIColor colorWithRed:85 Green:85 Blue:85];
        _titleLbl.minimumFontSize = 17;
        _titleLbl.adjustsFontSizeToFitWidth = YES;
        _titleLbl.textAlignment = NSTextAlignmentCenter;
        _titleLbl.borderStyle = UITextBorderStyleRoundedRect;
        _titleLbl.backgroundColor = [UIColor clearColor];
        _titleLbl.contentMode = UIViewContentModeScaleToFill;
    }
    return _titleLbl;
}

-(UITextView *) descLbl {
    if (!_descLbl) {
        _descLbl = [[UITextView alloc]init];
        _descLbl.translatesAutoresizingMaskIntoConstraints = NO;
        _descLbl.text = @"";
        _descLbl.font = [UIFont fontWithName:@"Helvetica Neue" size:18];
        _descLbl.backgroundColor = [UIColor clearColor];
        _descLbl.layer.borderWidth = 0.5f;
        _descLbl.layer.borderColor = [[UIColor colorWithRed:204 Green:204 Blue:204] CGColor];
        _descLbl.layer.cornerRadius = 6;
        _descLbl.contentMode = UIViewContentModeScaleToFill;
        _descLbl.delegate = self;
    }
    return _descLbl;
}

-(UIButton *) postBtn {
    if (!_postBtn) {
        _postBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _postBtn.translatesAutoresizingMaskIntoConstraints = NO;
        [_postBtn setTitle:@"Make Post" forState:UIControlStateNormal];
        [_postBtn setTintColor:[UIColor whiteColor]];
        [_postBtn setBackgroundColor:[UIColor colorWithRed:61 Green:91 Blue:151]];
        [_postBtn.titleLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:20]];
        _postBtn.layer.cornerRadius = 6;
        [_postBtn addTarget:self action:@selector(handlePost) forControlEvents:UIControlEventTouchUpInside];
    }
    return _postBtn;
}

-(UIButton *) cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _cancelBtn.translatesAutoresizingMaskIntoConstraints = NO;
        [_cancelBtn setTitle:@"Cancel" forState:UIControlStateNormal];
        [_cancelBtn setTintColor:[UIColor whiteColor]];
        [_cancelBtn.titleLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:18]];
        [_cancelBtn addTarget:self action:@selector(handleCancelBtnPress) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}

-(UILabel *) placeholderLabel {
    if (!_placeholderLabel) {
        _placeholderLabel = [[UILabel alloc] init];
        _placeholderLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [_placeholderLabel setText:@"Enter Description"];
        [_placeholderLabel setBackgroundColor:[UIColor clearColor]];
        [_placeholderLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:18]];
        [_placeholderLabel setTextColor:[UIColor colorWithRed:204 Green:204 Blue:204]];
    }
    return _placeholderLabel;
}

-(UIImagePickerController *)imagePicker {
    if (!_imagePicker) {
        _imagePicker = [[UIImagePickerController alloc]init];
        _imagePicker.delegate = self;
    }
    return _imagePicker;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self.view addSubview:self.topContainer];
    [self setupTopContainer];
    
    [self.view addSubview:self.postImg];
    [self.view addSubview:self.titleLbl];
    [self.view addSubview:self.descLbl];
    [self.view addSubview:self.postBtn];
    [self setupMainView];
    
    [self.descLbl addSubview:self.placeholderLabel];
    [self setupPlaceholder];
}

-(void)setupTopContainer {
    [self.topContainer.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.topContainer.heightAnchor constraintEqualToConstant:64].active = YES;
    [self.topContainer.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.topContainer.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    
    [self.topContainer addSubview: self.cancelBtn];
    [self.cancelBtn.bottomAnchor constraintEqualToAnchor:self.topContainer.bottomAnchor constant:-4].active = YES;
    [self.cancelBtn.heightAnchor constraintEqualToConstant:32].active = YES;
    [self.cancelBtn.widthAnchor constraintEqualToConstant:64].active = YES;
    [self.cancelBtn.leftAnchor constraintEqualToAnchor:self.topContainer.leftAnchor constant:8].active = YES;
}

-(void)setupMainView {
    [self.postImg.topAnchor constraintEqualToAnchor:self.topContainer.bottomAnchor constant:35].active = YES;
    [self.postImg.widthAnchor constraintEqualToConstant:self.view.frame.size.width * 0.6].active = YES;
    [self.postImg.heightAnchor constraintEqualToAnchor:self.postImg.widthAnchor multiplier:1].active = YES;
    [self.postImg.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    
    [self.titleLbl.topAnchor constraintEqualToAnchor:self.postImg.bottomAnchor constant:25].active = YES;
    [self.titleLbl.heightAnchor constraintEqualToConstant:36].active = YES;
    [self.titleLbl.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant: 28].active = YES;
    [self.titleLbl.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant: -28].active = YES;

    [self.postBtn.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-20].active = YES;
    [self.postBtn.heightAnchor constraintEqualToConstant:38].active = YES;
    [self.postBtn.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant: 28].active = YES;
    [self.postBtn.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant: -28].active = YES;
    
    [self.descLbl.topAnchor constraintEqualToAnchor:self.titleLbl.bottomAnchor constant:20].active = YES;
    [self.descLbl.bottomAnchor constraintEqualToAnchor:self.postBtn.topAnchor constant:-20].active = YES;
    [self.descLbl.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant: 28].active = YES;
    [self.descLbl.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant: -28].active = YES;
}

-(void)setupPlaceholder {
    [self.placeholderLabel.topAnchor constraintEqualToAnchor:self.descLbl.topAnchor constant:1].active = YES;
    [self.placeholderLabel.heightAnchor constraintEqualToConstant:36].active = YES;
    [self.placeholderLabel.leftAnchor constraintEqualToAnchor:self.descLbl.leftAnchor constant: 5].active = YES;
    [self.placeholderLabel.rightAnchor constraintEqualToAnchor:self.descLbl.rightAnchor constant: -28].active = YES;
}

-(void)textViewDidChange:(UITextView *)textView {
    if(![self.descLbl hasText]) {
        self.placeholderLabel.hidden = NO;
    } else if ([[self.descLbl subviews] containsObject:self.placeholderLabel]) {
        self.placeholderLabel.hidden = YES;
    }
}

-(void)textViewDidEndEditing:(UITextView *)textView {
    if (![textView hasText]) {
        self.placeholderLabel.hidden = NO;
    }
}

-(void) handleCancelBtnPress {
    [self dismissViewControllerAnimated:YES completion:nil];
}



-(void)handleImgPick {
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

-(void)handlePost {
    if(self.postImg.image && self.titleLbl.text && self.descLbl.text){
        NSString *imgPath = [[DataService instance] saveImageAndCreatePathWithImage:self.postImg.image];
        Post *post = [[Post alloc] initWithImagePath:imgPath Title:self.titleLbl.text Description:self.descLbl.text];
        [[DataService instance] addPost:post];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary<NSString *,id> *)editingInfo {
    [self.imagePicker dismissViewControllerAnimated:true completion:nil];
    self.postImg.image = image;
}


@end
