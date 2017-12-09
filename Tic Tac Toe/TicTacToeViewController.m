//
//  ViewController.m
//  Tic Tac Toe
//
//  Created by Jonathan Collins on 12/8/17.
//  Copyright © 2017 JC. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "TicTacToeConstants.h"

@interface ViewController ()
    @property (nonatomic) int gridLength;
    @property (nonatomic) int playCount;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.gridLength = self.view.frame.size.width - kOffset - kOffset;

    [self makeGame];
}

- (void) makeGame {
    self.playCount = 0;
    [self makeNewGameButton];
    for (int x = 0; x < kLevel; x++) {
        for (int l = 1; l < kLevel; l++) {
            [self drawVerticalGridLine:l];
            [self drawHorizontalGridLine:l];
        }
        for (int y = 0; y < kLevel; y++) {
            [self makePlayButtonAt:x And:y];
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) makePlayButtonAt:(int)x And:(int) y {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(buttonTapped:)
     forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(x/kLevel * self.gridLength + kOffset, y/kLevel * self.gridLength + (self.view.center.y - self.gridLength/2), self.gridLength/kLevel, self.gridLength/kLevel);
    [self.view addSubview:button];
}

- (void) drawVerticalGridLine:(int)l {
    UIBezierPath *path = [UIBezierPath bezierPath];
    int xCoordinate = (self.gridLength) * l / kLevel + kOffset;
    [path moveToPoint:CGPointMake(xCoordinate, self.view.center.y - self.gridLength/2)];
    [path addLineToPoint:CGPointMake(xCoordinate, self.view.center.y + self.gridLength/2)];
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = self.view.bounds;
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = [[UIColor blackColor] CGColor];
    pathLayer.fillColor = nil;
    pathLayer.lineWidth = kGridLineWidth;
    pathLayer.lineJoin = kCALineJoinBevel;
    
    [self.view.layer addSublayer:pathLayer];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:kLine1Key];
    pathAnimation.duration = kAnimationDuration;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [pathLayer addAnimation:pathAnimation forKey:kLine1Key];
}

- (void) drawHorizontalGridLine:(int)l {
    UIBezierPath *path = [UIBezierPath bezierPath];
    int yCoordinate = (self.view.center.y - self.gridLength/2) + (self.gridLength * l / kLevel);
    [path moveToPoint:CGPointMake(kOffset, yCoordinate)];
    [path addLineToPoint:CGPointMake(kOffset + self.gridLength, yCoordinate)];
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = self.view.bounds;
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = [[UIColor blackColor] CGColor];
    pathLayer.fillColor = nil;
    pathLayer.lineWidth = kGridLineWidth;
    pathLayer.lineJoin = kCALineJoinBevel;
    
    [self.view.layer addSublayer:pathLayer];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:kLine1Key];
    pathAnimation.duration = kAnimationDuration;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [pathLayer addAnimation:pathAnimation forKey:kLine1Key];
}

- (void) buttonTapped:(UIButton *) sender {
    if (self.playCount % 2 == 0) {
        [self drawCircleUsingFrame:sender.frame];
    } else {
        [self drawXUsingFrame:sender.frame];
    }
    self.playCount += 1;
    sender.enabled = NO;
}

- (void) drawCircleUsingFrame:(CGRect)frame {
    int radius = self.gridLength/kLevel/4;
    int strokeWidth = kGridLineWidth;
    CGColorRef color = [UIColor blueColor].CGColor;
    
    CGFloat startAngle = 0;
    CGFloat endAngle = 1;
    
    CAShapeLayer *circle = [CAShapeLayer layer];
    
    circle.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2.0*radius, 2.0*radius) cornerRadius:radius].CGPath;
    
    circle.position = CGPointMake(CGRectGetMidX(frame)-radius, CGRectGetMidY(frame)-radius);
    
    circle.fillColor = [UIColor clearColor].CGColor;
    circle.strokeColor = color;
    circle.lineWidth = strokeWidth;
    
    [self.view.layer addSublayer:circle];
    // Change the model layer's property first.
    circle.strokeEnd = endAngle;
    
    // Then apply the animation.
    CABasicAnimation *drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    drawAnimation.duration  = kAnimationDuration;
    drawAnimation.fromValue = [NSNumber numberWithFloat:startAngle];
    drawAnimation.toValue   = [NSNumber numberWithFloat:endAngle];
    drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [circle addAnimation:drawAnimation forKey:@"drawCircleAnimation"];
}

- (void) drawXUsingFrame:(CGRect)frame {
    UIBezierPath *path1 = [UIBezierPath bezierPath];

    [path1 moveToPoint:CGPointMake(frame.origin.x + frame.size.width/4.0, frame.origin.y + frame.size.height/4.0)];
    [path1 addLineToPoint:CGPointMake(frame.origin.x + frame.size.width*3.0/4.0, frame.origin.y + frame.size.height*3.0/4.0)];
    
    CAShapeLayer *path1Layer = [CAShapeLayer layer];
    path1Layer.frame = self.view.bounds;
    path1Layer.path = path1.CGPath;
    path1Layer.strokeColor = [[UIColor redColor] CGColor];
    path1Layer.fillColor = nil;
    path1Layer.lineWidth = kGridLineWidth;
    path1Layer.lineJoin = kCALineJoinBevel;
    
    [self.view.layer addSublayer:path1Layer];
    
    CABasicAnimation *path1Animation = [CABasicAnimation animationWithKeyPath:kLine1Key];
    path1Animation.duration = kAnimationDuration;
    path1Animation.fromValue = [NSNumber numberWithFloat:0.0f];
    path1Animation.toValue = [NSNumber numberWithFloat:1.0f];
    [path1Layer addAnimation:path1Animation forKey:kLine1Key];
    
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    
    [path2 moveToPoint:CGPointMake(frame.origin.x + frame.size.width*3.0/4.0, frame.origin.y + frame.size.height/4.0)];
    [path2 addLineToPoint:CGPointMake(frame.origin.x + frame.size.width/4.0, frame.origin.y + frame.size.height*3.0/4.0)];
    
    CAShapeLayer *path2Layer = [CAShapeLayer layer];
    path2Layer.frame = self.view.bounds;
    path2Layer.path = path2.CGPath;
    path2Layer.strokeColor = [[UIColor redColor] CGColor];
    path2Layer.fillColor = nil;
    path2Layer.lineWidth = kGridLineWidth;
    path2Layer.lineJoin = kCALineJoinBevel;
    
    [self.view.layer addSublayer:path2Layer];
    
    CABasicAnimation *path2Animation = [CABasicAnimation animationWithKeyPath:kLine2Key];
    path2Animation.duration = kAnimationDuration;
    path2Animation.fromValue = [NSNumber numberWithFloat:0.0f];
    path2Animation.toValue = [NSNumber numberWithFloat:1.0f];
    [path2Layer addAnimation:path2Animation forKey:kLine2Key];
}

- (void) makeNewGameButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:self
               action:@selector(newGame:)
     forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(kOffset, self.view.frame.size.height - 100, self.view.frame.size.width - kOffset * 2, 30);
    button.hidden = NO;
    [button setTitle:@"New Game" forState:UIControlStateNormal];
    [self.view addSubview:button];
}

- (void) newGame:(UIButton *)sender {
    self.view.layer.sublayers = nil;
    [self makeGame];
}



@end
