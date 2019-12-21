//
//  UIImage+RoundCorner.m
//  iOSTechExplore
//
//  Created by Justin on 2019/12/21.
//  Copyright © 2019 Justin. All rights reserved.
//

#import "UIImage+RoundCorner.h"


@implementation UIImage (RoundCorner)

- (UIImage *)imageWithCornerRadius:(CGFloat)radius ofSize:(CGSize)size {
    
    CGRect rect = (CGRect){0, 0, size};
    
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    
    CGContextAddPath(UIGraphicsGetCurrentContext(), [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (instancetype)drawImageWithCycle {
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    [path addClip];
    [self drawAtPoint:CGPointZero];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}

@end
