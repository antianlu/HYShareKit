//
//  HYShareItem.m
//  HYShareDemo
//
//  Created by Harry Yan on 15/2/4.
//  Copyright (c) 2015年  Harry Yan. All rights reserved.
//

#import "HYShareItem.h"

@implementation HYShareItem

- (NSArray *)activityItems
{
    NSMutableArray * items = [NSMutableArray array];
    
    if (nil != self.title) {
        [items addObject:self.title];
    }
    
    
    if (nil != self.thumbImage) {
        [items addObject:self.thumbImage];
    }
    
    
    if (nil != self.url) {
        [items addObject:self.url];
    }
    
    
    if (nil != self.message) {
        [items addObject:self.message];
    }
    
    return items;
}

@end
