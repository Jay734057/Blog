//
//  Post.h
//  Blog
//
//  Created by Jianyu ZHU on 24/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject <NSCoding>

@property (nonatomic, strong, readonly) NSString *imagePath;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *postDesc;

-(id)init;
-(id)initWithImagePath: (NSString *) imagePath Title: (NSString *) title Description: (NSString *) desc;

@end
