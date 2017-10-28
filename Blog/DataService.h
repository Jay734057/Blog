//
//  DataService.h
//  Blog
//
//  Created by Jianyu ZHU on 24/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class Post;

@interface DataService : NSObject

+(id _Nullable ) instance;
-(NSMutableArray *_Nullable)loadedPosts;
-(void)savePost;
-(void)loadPosts;
-(NSString *_Nonnull)saveImageAndCreatePathWithImage: (UIImage *_Nonnull) image;
-(UIImage *_Nullable)imageForPath: (NSString *_Nonnull)path;
-(void)addPost: (Post *_Nonnull)post;
-(NSString *_Nullable)documentsPathForFileName: (NSString *_Nonnull)name;

@end
