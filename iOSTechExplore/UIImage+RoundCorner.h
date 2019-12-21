//
//  UIImage+RoundCorner.h
//  iOSTechExplore
//
//  Created by Justin on 2019/12/21.
//  Copyright © 2019 Justin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (RoundCorner)

- (UIImage *)imageWithCornerRadius:(CGFloat)radius ofSize:(CGSize)size;
- (instancetype)drawImageWithCycle;

@end

NS_ASSUME_NONNULL_END
