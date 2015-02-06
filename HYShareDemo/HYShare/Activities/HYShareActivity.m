//
//  WQShareActivity.m
//  HYShareDemo
//
//  Created by Harry Yan on 15/1/30.
//  Copyright (c) 2015年  Harry Yan. All rights reserved.
//

#import "HYShareActivity.h"

@implementation HYShareActivity

#pragma mark - override

+ (UIActivityCategory)activityCategory
{
    return UIActivityCategoryShare;
}

- (NSString *)activityType
{
    return NSStringFromClass([self class]);
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    return YES;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    NSInteger count = 0;
    
    for (id activityItem in activityItems) {
        if ([activityItem isKindOfClass:[UIImage class]]) {
            self.thumbImage = activityItem;
        }
        if ([activityItem isKindOfClass:[NSURL class]]) {
            self.url = activityItem;
        }
        if ([activityItem isKindOfClass:[NSString class]]) {
            
            if (count == 0) {
                self.title = activityItem;
                count++;
            } else {
                self.message = activityItem;
            }
        }
    }
}


@end