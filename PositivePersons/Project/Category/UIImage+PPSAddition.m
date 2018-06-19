//
//  UIImage+PPSAddition.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/6/19.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "UIImage+PPSAddition.h"

@implementation UIImage (PPSAddition)

+ (void)load
{
    Method imageNameMethod = class_getClassMethod([UIImage class], @selector(imageNamed:));
    Method ppsImageNameMethod = class_getClassMethod([UIImage class], @selector(ppsImageNamed:));
    method_exchangeImplementations(imageNameMethod, ppsImageNameMethod);
}

+ (UIImage *)ppsImageNamed:(NSString *)imageName
{
    UIImage *image = [[UIImage ppsImageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    return image;
}

@end
