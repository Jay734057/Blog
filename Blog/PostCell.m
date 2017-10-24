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
UIImageView *postImage;
UILabel *titleLabel;
UILabel *descLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
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
    [self addSubview:contentView];
    [self setupCell];
    
    [contentView addSubview:postImage];
    [contentView addSubview:titleLabel];
    [contentView addSubview:descLabel];
    [self setupContentView];
}

-(void)setupCell {
    [contentView.topAnchor constraintEqualToAnchor:self.topAnchor constant:8].active = YES;
    [contentView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-8].active = YES;
    [contentView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:8].active = YES;
    [contentView.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-8].active = YES;
}

-(void)setupContentView {
    [postImage.topAnchor constraintEqualToAnchor:contentView.topAnchor constant:8].active = YES;
    [postImage.bottomAnchor constraintEqualToAnchor:contentView.bottomAnchor constant:-8].active = YES;
    [postImage.leftAnchor constraintEqualToAnchor:contentView.leftAnchor constant:8].active = YES;
    [postImage.widthAnchor constraintEqualToAnchor:postImage.heightAnchor].active = YES;
    
    [titleLabel.topAnchor constraintEqualToAnchor:contentView.topAnchor constant:8].active = YES;
    [titleLabel.leftAnchor constraintEqualToAnchor:postImage.rightAnchor constant:8].active = YES;
    [titleLabel.rightAnchor constraintEqualToAnchor:contentView.rightAnchor constant:-8].active = YES;
    [titleLabel.heightAnchor constraintEqualToConstant:20].active = YES;
    
    [descLabel.topAnchor constraintEqualToAnchor:titleLabel.topAnchor constant:4].active = YES;
    [descLabel.leftAnchor constraintEqualToAnchor:postImage.rightAnchor constant:8].active = YES;
    [descLabel.rightAnchor constraintEqualToAnchor:contentView.rightAnchor constant:-8].active = YES;
    [descLabel.bottomAnchor constraintEqualToAnchor:contentView.bottomAnchor constant:-8].active = YES;
    
}

-(void)configureCellWithPost:(Post *) post {
    titleLabel.text = post.title;
    postImage.image = [[DataService instance] imageForPath:post.imagePath];
    descLabel.text = post.postDesc;
}


@end
