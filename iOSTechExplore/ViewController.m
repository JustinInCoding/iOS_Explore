//
//  ViewController.m
//  iOSTechExplore
//
//  Created by Justin on 2019/12/21.
//  Copyright © 2019 Justin. All rights reserved.
//

#import "ViewController.h"
#import "ABCBezierPathView.h"
#import "UIImage+RoundCorner.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self textLayerTest];
//    [self shapeLayerTest];
//    [self gradientLayerTest];
//    [self shapeLayerDetailTest];
//    [self imageViewTest];
    
//    ABCBezierPathView *pathView = [[ABCBezierPathView alloc] initWithFrame:CGRectMake(100.0f, 100.0f, 100.0f, 100.0f)];
//    [self.view addSubview:pathView];
    
//    [self roundCornerImage];
    [self drawCircleImage];

    
    
}

- (void)textLayerTest {
    
    UIView *textView = [[UIView alloc] initWithFrame:CGRectMake(50.0f, 50.0f, 200.0f, 50.0f)];
    CATextLayer *text = [CATextLayer layer];
    text.frame = textView.frame;
    text.string = @"CAText";
    
    text.foregroundColor = [UIColor whiteColor].CGColor;
    text.backgroundColor = [UIColor blackColor].CGColor;
    
    text.wrapped = YES;
    
    text.font = (__bridge CFTypeRef)[UIFont systemFontOfSize:30].fontName;
    text.alignmentMode = kCAAlignmentCenter;
    
    text.contentsScale = [UIScreen mainScreen].scale;
    [textView.layer addSublayer:text];
    [self.view addSubview:textView];
    
}

- (void)shapeLayerTest {
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path moveToPoint:CGPointMake(200.0f, 100.0f)];
    
    [path addArcWithCenter:CGPointMake(150.0f, 100.0f)
                    radius:50.0f
                startAngle:0
                  endAngle:2 * M_PI
                 clockwise:YES];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    
    layer.lineWidth = 10;
    
    layer.lineCap = kCALineCapRound;
    layer.lineJoin = kCALineJoinRound;
    
    layer.path = path.CGPath;
    layer.contentsScale = UIScreen.mainScreen.scale;
    [self.view.layer addSublayer:layer];
    
}

- (void)gradientLayerTest {
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(50.0f, 50.0f, 150.0f, 150.0f)];
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = contentView.bounds;
    
    layer.colors = @[
        (__bridge id)[UIColor greenColor].CGColor,
        (__bridge id)[UIColor yellowColor].CGColor,
        (__bridge id)[UIColor orangeColor].CGColor,
    ];
    
    layer.locations = @[@0.0, @0.3, @0.5];
    
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 1);
    
    layer.contentsScale = UIScreen.mainScreen.scale;
    [contentView.layer addSublayer:layer];
    [self.view addSubview:contentView];
    
}

- (void)shapeLayerDetailTest {
    
    CAShapeLayer *shaperLayer = [CAShapeLayer layer];
    
    shaperLayer.lineWidth = 2;
    shaperLayer.lineCap = kCALineCapRound;
    shaperLayer.lineJoin = kCALineJoinRound;
    
    shaperLayer.strokeColor = [UIColor redColor].CGColor;
    shaperLayer.fillColor = [UIColor whiteColor].CGColor;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(160, 100)];
    [bezierPath addLineToPoint:CGPointMake(100, 160)];
    [bezierPath addLineToPoint:CGPointMake(100, 220)];
    [bezierPath addLineToPoint:CGPointMake(160, 280)];
    [bezierPath addLineToPoint:CGPointMake(220, 220)];
    [bezierPath addLineToPoint:CGPointMake(220, 160)];
    [bezierPath closePath];
    
    shaperLayer.path = bezierPath.CGPath;
    shaperLayer.contentsScale = UIScreen.mainScreen.scale;
    [self.view.layer addSublayer:shaperLayer];
    
    
}

- (void)imageViewTest {
    
    UIImage *image = [UIImage imageNamed:@"AppIcon"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[image imageWithCornerRadius:10 ofSize:image.size]];
    imageView.frame = CGRectMake(0.0f, 0.0f, 100.0f, 100.0f);
    [self.view addSubview:imageView];
    imageView.center = self.view.center;
    
}

- (void)maskViewTest {
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10.f, 10.f, 30.f, 30.f) cornerRadius:5.f];
    
    CAShapeLayer *shaperLayer = [CAShapeLayer layer];
    shaperLayer.path = path.CGPath;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AppIcon"]];
    shaperLayer.frame = imageView.bounds;
    imageView.layer.mask = shaperLayer;
    imageView.frame = CGRectMake(0.f, 0.f, 80, 80);
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
    
}

- (void)roundCornerImage {
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AppIcon"]];
    
    imageView.layer.cornerRadius = 10.f;
    imageView.layer.masksToBounds = YES;
    imageView.layer.rasterizationScale = UIScreen.mainScreen.scale;
    imageView.layer.shouldRasterize = YES;
    
    imageView.frame = CGRectMake(0.f, 0.f, 80, 80);
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
    
}

- (void)drawCircleImage {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:imageView];
    imageView.center = self.view.center;
    
    UIImage *image = [UIImage imageNamed:@"AppIcon"];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // handle circle
        UIImage *circleImage = [image drawImageWithCycle];
        dispatch_async(dispatch_get_main_queue(), ^{
            imageView.image = circleImage;
        });
    });
    
}


@end
