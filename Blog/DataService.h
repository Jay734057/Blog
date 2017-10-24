//
//  DataService.h
//  Blog
//
//  Created by Jianyu ZHU on 24/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Post.h"

@interface DataService : NSObject

extern NSString *const KEY_POSTS;
+(DataService *) instance;

-(NSMutableArray *)loadedPosts;
-(void)savePost;
-(void)loadPosts;
-(NSString *)saveImageAndCreatePathWithImage: (UIImage *) image;
-(UIImage *)imageForPath: (NSString *)path;
-(void)addPost: (Post *)post;
-(NSString *)documentsPathForFileName: (NSString *)name;

@end
