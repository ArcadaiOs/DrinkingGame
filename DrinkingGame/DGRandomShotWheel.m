//
//  DGRandomShotWheel.m
//  DrinkingGame
//
//  Created by student on 2/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGRandomShotWheel.h"

@implementation DGRandomShotWheel

- (id)initWithFrame:(CGRect)frame andController:(DGController*) controllerIn andSelection:(int) selIn
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        controller = controllerIn;
        count = [controller.players count];
        step = (M_PI * 2)/count;
        sel = selIn;
        NSLog(@"sel: %i",sel);
    }
    return self;
}
-(void) spin{
    float spin = sel*((M_PI*2)-step)+M_PI_4+M_PI*4;
    NSLog(@"spin: %f",spin);
    NSLog(@"step: %f",step);
    CABasicAnimation* spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [spinAnimation setDelegate:self];
    spinAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    spinAnimation.toValue = [NSNumber numberWithFloat:spin];
    spinAnimation.removedOnCompletion = NO;
    spinAnimation.fillMode = kCAFillModeForwards;
    [spinAnimation setDuration:spin*0.4f];
    //[self.layer addAnimation:spinAnimation forKey:@"spinAnimation"];
}
- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag{
    NSLog(@"%@'s gotta drink (%i)",[[[controller players] objectAtIndex:sel] name],sel);
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    float margin = 10.0f;
    CGRect rect2 = CGRectMake(rect.origin.x+margin/2,rect.origin.y+margin/2,rect.size.width-margin,rect.size.height-margin);
    int i;
    float startAngle,endAngle = 0,middleAngle,lineWidth = 2.0f, size = (rect2.size.width/2);
    DGPlayer* player;
    CGPoint startLinePos,endLinePos;
    CGPoint center = CGPointMake(rect.size.width/2, rect2.size.height/2);
    //CGPoint center = CGPointMake(rect2.size.width/2+rect2.origin.x, rect2.size.height/2+rect2.origin.y);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, lineWidth);
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    CGFloat components[] = {0.0, 0.0, 1.0, 1.0};
    
    CGColorRef color = CGColorCreate(colorspace, components);
    
    CGContextSetStrokeColorWithColor(context, color);
    //slicepath
    CGMutablePathRef path = CGPathCreateMutable();
    startAngle = -M_PI_2-step/2;
    endAngle = -M_PI_2+step/2;
    startLinePos = [self getCirclePoint:size pos:center angle:startAngle];
    endLinePos = [self getCirclePoint:size pos:center angle:endAngle];
    
    CGPathAddArc(path, NULL, center.x, center.y, size, startAngle, endAngle, NO);
    CGPathAddLineToPoint(path, NULL, center.x, center.y);
    CGPathCloseSubpath(path);
    //CGPathAddLineToPoint(path, NULL, startLinePos.x, startLinePos.y);
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.fillColor = [[UIColor whiteColor] CGColor];
    maskLayer.backgroundColor = [[UIColor clearColor] CGColor];
    maskLayer.path = path;
    endAngle = startAngle;
    
    for(i=0;i<count;i++){
        player = [[controller players] objectAtIndex:i];
        startAngle = endAngle;
        endAngle = startAngle + step;
        middleAngle = (startAngle+endAngle)/2;
        CGPoint imgPos = [self getCirclePoint:size/2 pos:CGPointMake(center.x, center.y) angle:middleAngle];
        
        UIImageView *imageView = [ [ UIImageView alloc ] initWithFrame:CGRectMake(0, 0, size*2, size) ];
        imageView.image = [player image];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.fillColor = [[UIColor whiteColor] CGColor];
        maskLayer.backgroundColor = [[UIColor clearColor] CGColor];
        maskLayer.path = path;
        [imageView.layer setMask:maskLayer];
        [imageView setCenter:CGPointMake(imgPos.x,imgPos.y)];
        //[imageView setCenter:CGPointMake(imageView.frame.origin.x+imageView.frame.size.width/2, imageView.frame.origin.y+imageView.frame.size.height)];
        [self addSubview:imageView];
        CGAffineTransform rotate = CGAffineTransformMakeRotation( middleAngle+M_PI_2);
        [imageView setTransform:rotate];
    }
    
    CGContextSetLineWidth(context, margin);
    CGFloat strokeColor[4]    = {1.0f,0,0,1.0};
    CGContextSetStrokeColor(context, strokeColor);
    
    CGContextAddEllipseInRect(context, rect2);
    
    CGContextStrokePath(context);
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
}
- (CGPoint) getCirclePoint: (CGFloat) diam pos:(CGPoint) pos angle: (CGFloat) angle{
    return CGPointMake(diam*(cosf(angle))+pos.x,diam*(sinf(angle))+pos.y);
}

@end
