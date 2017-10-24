//
//  Post.m
//  Blog
//
//  Created by Jianyu ZHU on 24/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import "Post.h"

@implementation Post

-(id)init { return [super init];}


-(id)initWithImagePath: (NSString *) imagePath Title: (NSString *) title Description: (NSString *) desc{
    self = [self init];
    
    if(self) {
        _imagePath = imagePath;
        _title = title;
        _postDesc = desc;
    }
    return self;
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [self init];
    
    if(self) {
        _imagePath = [aDecoder decodeObjectForKey:@"imagePath"];
        _title = [aDecoder decodeObjectForKey:@"title"];
        _postDesc = [aDecoder decodeObjectForKey:@"description"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *) aCoder{
    [aCoder encodeObject:_imagePath forKey:@"imagePath"];
    [aCoder encodeObject:_title forKey:@"title"];
    [aCoder encodeObject:_postDesc forKey:@"description"];
}

@end
