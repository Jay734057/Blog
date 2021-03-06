//
//  DataService.m
//  Blog
//
//  Created by Jianyu ZHU on 24/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import "DataService.h"

#define KEY_POSTS "posts"

@implementation DataService

+(id)instance {
    static DataService *sharedInstance = nil;
    
    @synchronized (self) {
        if (sharedInstance == nil)
            sharedInstance = [[self alloc]init];
    }
    
    return sharedInstance;
}

NSMutableArray<Post *> *loadedPosts;

-(NSMutableArray<Post *> *)loadedPosts {
    return loadedPosts;
}

-(void)savePost {
    NSData * postData = [NSKeyedArchiver archivedDataWithRootObject: loadedPosts];
    [[NSUserDefaults standardUserDefaults] setObject: postData forKey:@KEY_POSTS];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)loadPosts {
    NSData *postData = [[NSUserDefaults standardUserDefaults] objectForKey:@KEY_POSTS];
    if (postData) {
        NSMutableArray<Post *> *postsArray = [NSKeyedUnarchiver unarchiveObjectWithData:postData];
        if (postsArray) {
            loadedPosts = postsArray;
        }
    }
    
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName: [NSString stringWithFormat: @"postsLoaded"] object:nil]];
}

-(NSString *)saveImageAndCreatePathWithImage:(UIImage *)image {
    NSData *imgData = UIImagePNGRepresentation(image);
    NSString *imgPath = [NSString stringWithFormat:@"image%f.png", [NSDate timeIntervalSinceReferenceDate]];
    NSString *fullPath = [self documentsPathForFileName:imgPath];
    [imgData writeToURL:[NSURL fileURLWithPath:fullPath] atomically:YES];
    return imgPath;
}

-(UIImage *)imageForPath:(NSString *)path {
    NSString *fullPath = [self documentsPathForFileName:path];
    UIImage * img = [UIImage imageNamed:fullPath];
    return img;
}

-(void)addPost:(Post *)post {
    [[self loadedPosts] addObject: post];
    [self savePost];
    [self loadPosts];
}

-(void)deletePost:(NSInteger)index {
    [[self loadedPosts] removeObjectAtIndex: index];
}

-(NSString *)documentsPathForFileName:(NSString *)name {
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *fullPath = path[0];
    return [fullPath stringByAppendingPathComponent:name];
}

@end

