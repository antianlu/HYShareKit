//
//  HYImageUtilities.m
//  HYShareDemo
//
//  Created by Harry Yan on 15/2/5.
//  Copyright (c) 2015年  Harry Yan. All rights reserved.
//

#import "HYImageUtilities.h"

@implementation HYImageUtilities

+ (UIImage *)scaleImage:(UIImage *)image withStandardWidth:(CGFloat)standardWidth
{
    if (image) {
        CGFloat width = standardWidth;
        CGFloat height = image.size.height * width / image.size.width;
        UIGraphicsBeginImageContext(CGSizeMake(width, height));
        [image drawInRect:CGRectMake(0, 0, width, height)];
        UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return scaledImage;
    }
    
    return nil;
}


@end
