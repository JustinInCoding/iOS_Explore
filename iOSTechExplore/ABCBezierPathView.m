//
//  ABCBezierPathView.m
//  iOSTechExplore
//
//  Created by Justin on 2019/12/21.
//  Copyright © 2019 Justin. All rights reserved.
//

#import "ABCBezierPathView.h"

@implementation ABCBezierPathView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
//    [self bezierPathInDrawRect];
    [self test];

    
}

- (void)bezierPathInDrawRect {
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50)
                                                        radius:50
                                                    startAngle:0
                                                      endAngle:2 * M_PI
                                                     clockwise:YES];
    path.lineWidth = 5;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    
    
    [[UIColor redColor] setFill];
    [path fill];
    [path stroke];
}

- (void)test {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 50, 50));
    
    [[UIColor redColor] set];
    
    CGContextFillPath(ctx);
    
}


@end
