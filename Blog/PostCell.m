//
//  PostCell.m
//  Blog
//
//  Created by Jianyu ZHU on 24/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import "PostCell.h"
#import "DataService.h"

@interface PostCell()

@property (nonatomic, strong) UIView *cellView;
@property (nonatomic, strong) UIImageView *postImage;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *desc;

@end

@implementation PostCell

-(UIView *)contentView {
    if(!_cellView) {
        _cellView = [[UIView alloc] init];
        _cellView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _cellView;
}


-(UIImageView *)postImage {
    if(!_postImage) {
        _postImage = [[UIImageView alloc] init];
        _postImage.translatesAutoresizingMaskIntoConstraints = NO;
        _postImage.contentMode = UIViewContentModeScaleToFill;
        _postImage.clipsToBounds = YES;
        _postImage.layer.cornerRadius = 36;
    }
    return _postImage;
}



-(UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] init];
        _title.translatesAutoresizingMaskIntoConstraints = NO;
        _title.font = [UIFont fontWithName: @"Helvetica Neue" size:16];
        _title.lineBreakMode = NSLineBreakByTruncatingTail;
        //    title.backgroundColor = [UIColor blueColor];
    }
    return _title;
}



-(UILabel *)desc {
    if (!_desc) {
        _desc = [[UILabel alloc] init];
        _desc.translatesAutoresizingMaskIntoConstraints = NO;
        _desc.font = [UIFont fontWithName: @"Helvetica Neue Light Italic" size:14];
        _desc.lineBreakMode = NSLineBreakByWordWrapping;
        _desc.numberOfLines = 2;
        //    desc.backgroundColor = [UIColor redColor];

    }
    return _desc;
}

-(instancetype)init {
    self = [super init];
    if (self){
        [self setupView];
    }
    return self;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        [self setupView];
    }
    return self;
}

-(void)setupView {
    [self addSubview:self.cellView];
    [self setupCell];
    
    [self.cellView addSubview:self.postImage];
    [self.cellView addSubview:self.title];
    [self.cellView addSubview:self.desc];
    [self setupContentView];
}

-(void)setupCell {
    [self.cellView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [self.cellView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    [self.cellView.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
    [self.cellView.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
}

-(void)setupContentView {
    [self.postImage.topAnchor constraintEqualToAnchor:self.cellView.topAnchor constant:8].active = YES;
    [self.postImage.bottomAnchor constraintEqualToAnchor:self.cellView.bottomAnchor constant:-8].active = YES;
    [self.postImage.leftAnchor constraintEqualToAnchor:self.cellView.leftAnchor constant:8].active = YES;
    [self.postImage.widthAnchor constraintEqualToAnchor:self.postImage.heightAnchor].active = YES;
    
    [self.title.topAnchor constraintEqualToAnchor:self.cellView.topAnchor constant:8].active = YES;
    [self.title.leftAnchor constraintEqualToAnchor:self.postImage.rightAnchor constant:8].active = YES;
    [self.title.rightAnchor constraintEqualToAnchor:self.cellView.rightAnchor constant:-8].active = YES;
    [self.title.heightAnchor constraintEqualToConstant:18].active = YES;
    
    [self.desc.topAnchor constraintEqualToAnchor:self.title.bottomAnchor constant:4].active = YES;
    [self.desc.leftAnchor constraintEqualToAnchor:self.postImage.rightAnchor constant:8].active = YES;
    [self.desc.rightAnchor constraintEqualToAnchor:self.cellView.rightAnchor constant:-8].active = YES;
    [self.desc.bottomAnchor constraintEqualToAnchor:self.cellView.bottomAnchor constant:-8].active = YES;
    
}

-(void)configureCellWithPost:(Post *) post {
    self.title.text = post.title;
    self.postImage.image = [[DataService instance] imageForPath:post.imagePath];
    self.desc.text = post.postDesc;
}

@end
