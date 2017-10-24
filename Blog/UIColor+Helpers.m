//
//  UIColor+Helpers.m
//  Blog
//
//  Created by Jianyu ZHU on 24/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import "UIColor+Helpers.h"

@implementation UIColor (Helpers)

+(UIColor *)colorWithRed: (CGFloat) red Green: (CGFloat)green Blue: (CGFloat)blue{
    return [UIColor colorWithRed:red/255 green:green/255 blue:blue/255 alpha:1];
}

@end
