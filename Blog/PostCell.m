//
//  PostCell.m
//  Blog
//
//  Created by Jianyu ZHU on 24/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import "PostCell.h"
#import "DataService.h"

@implementation PostCell

UIView *contentView;

-(UIView *)contentView {
    contentView = [[UIView alloc] init];
    contentView.translatesAutoresizingMaskIntoConstraints = NO;
    return contentView;
}

UIImageView *postImage;

-(UIImageView *)postImage {
    postImage = [[UIImageView alloc] init];
    postImage.translatesAutoresizingMaskIntoConstraints = NO;
    postImage.contentMode = UIViewContentModeScaleToFill;
    postImage.clipsToBounds = YES;
    postImage.layer.cornerRadius = 36;
    return postImage;
}

UILabel *title;

-(UILabel *)title {
    title = [[UILabel alloc] init];
    title.translatesAutoresizingMaskIntoConstraints = NO;
    title.font = [UIFont fontWithName: @"Helvetica Neue" size:16];
    title.lineBreakMode = NSLineBreakByTruncatingTail;
//    title.backgroundColor = [UIColor blueColor];
    return title;
}

UILabel *desc;

-(UILabel *)desc {
    desc = [[UILabel alloc] init];
    desc.translatesAutoresizingMaskIntoConstraints = NO;
    desc.font = [UIFont fontWithName: @"Helvetica Neue Light Italic" size:14];
    desc.lineBreakMode = NSLineBreakByWordWrapping;
    desc.numberOfLines = 2;
//    desc.backgroundColor = [UIColor redColor];
    return desc;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)init {
    self = [super init];
    if (self){
        [self setupView];
    }
    return self;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        [self setupView];
    }
    return self;
}

-(void)setupView {
    [self addSubview:[self contentView]];
    [self setupCell];
    
    [contentView addSubview:[self postImage]];
    [contentView addSubview:[self title]];
    [contentView addSubview:[self desc]];
    [self setupContentView];
}

-(void)setupCell {
    [contentView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [contentView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    [contentView.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
    [contentView.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
}

-(void)setupContentView {
    [postImage.topAnchor constraintEqualToAnchor:contentView.topAnchor constant:8].active = YES;
    [postImage.bottomAnchor constraintEqualToAnchor:contentView.bottomAnchor constant:-8].active = YES;
    [postImage.leftAnchor constraintEqualToAnchor:contentView.leftAnchor constant:8].active = YES;
    [postImage.widthAnchor constraintEqualToAnchor:postImage.heightAnchor].active = YES;
    
    [title.topAnchor constraintEqualToAnchor:contentView.topAnchor constant:8].active = YES;
    [title.leftAnchor constraintEqualToAnchor:postImage.rightAnchor constant:8].active = YES;
    [title.rightAnchor constraintEqualToAnchor:contentView.rightAnchor constant:-8].active = YES;
    [title.heightAnchor constraintEqualToConstant:18].active = YES;
    
    [desc.topAnchor constraintEqualToAnchor:title.bottomAnchor constant:4].active = YES;
    [desc.leftAnchor constraintEqualToAnchor:postImage.rightAnchor constant:8].active = YES;
    [desc.rightAnchor constraintEqualToAnchor:contentView.rightAnchor constant:-8].active = YES;
    [desc.bottomAnchor constraintEqualToAnchor:contentView.bottomAnchor constant:-8].active = YES;
    
}

-(void)configureCellWithPost:(Post *) post {
    title.text = post.title;
    postImage.image = [[DataService instance] imageForPath:post.imagePath];
    desc.text = post.postDesc;
}


@end
