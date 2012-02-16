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
    float spin = M_PI+sel*((M_PI*2)-step);//+M_PI*4;
    NSLog(@"spin: %f",spin);
    NSLog(@"step: %f",step);
    CABasicAnimation* spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [spinAnimation setDelegate:self];
    spinAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    spinAnimation.toValue = [NSNumber numberWithFloat:spin];
    spinAnimation.removedOnCompletion = NO;
    spinAnimation.fillMode = kCAFillModeForwards;
    [spinAnimation setDuration:spin*0.66f];
    [self.layer addAnimation:spinAnimation forKey:@"spinAnimation"];
}
- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag{
    //NSLog(@"%s's gotta drink",[[controller players] objectAtIndex:sel]);
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    
    int i;
    float startAngle,endAngle = 0,middleAngle,lineWidth = 2.0f,padding = 0.1f, size = rect.size.width/2, imgSize = size/2;
    DGPlayer* player;
    CGPoint startLinePos,endLinePos;
    CGPoint center = CGPointMake(rect.size.width/2, rect.size.height/2);
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
    //CGPathMoveToPoint(path, NULL, startLinePos.x, startLinePos.y);
    CGPathAddLineToPoint(path, NULL, center.x, center.y);
    CGPathAddLineToPoint(path, NULL, startLinePos.x, startLinePos.y);
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
        CGPoint imgPos = [self getCirclePoint:size/2 pos:center angle:middleAngle];
        
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
        
        
        /*CAShapeLayer *maskLayer = [CAShapeLayer layer];
        UIBezierPath *roundedPath = [UIBezierPath bezierPathWithArcCenter:center radius:size/2 startAngle:startAngle endAngle:endAngle clockwise:true];    
        maskLayer.fillColor = [[UIColor whiteColor] CGColor];
        maskLayer.backgroundColor = [[UIColor clearColor] CGColor];
        maskLayer.path = [roundedPath CGPath];*/
        
        
        //UIColor* imgPattern = [UIColor colorWithPatternImage: [player image]];
        //UIColor* imgPattern = [[UIColor alloc] initWithRed:20.0 / 255 green:59.0 / 255 blue:102.0 / 255 alpha:1.0];
        /*CGPoint imgPos = [self getCirclePoint:size/2-imgSize/2-30 pos:center angle:angle];
        if(i==0){
            linePos = [self getCirclePoint:size/2 pos:center angle:angle+step/2];
        }else{
            linePos = nextlinePos;
        }
        nextlinePos = [self getCirclePoint:size/2 pos:center angle:angle+step/2+step];
        CGContextMoveToPoint(context, rect.size.width/2, rect.size.height/2);
        CGContextAddLineToPoint(context, linePos.x, linePos.y);
        
    
        UIImageView *imageView = [ [ UIImageView alloc ] initWithFrame:CGRectMake(imgPos.x, imgPos.y, imgSize, imgSize) ];
        imageView.image = [player image];
        [imageView setCenter:CGPointMake(imgPos.x, imgPos.y)];
        [self addSubview:imageView];
        CGAffineTransform rotate = CGAffineTransformMakeRotation( angle+M_PI_2 );
        [imageView setTransform:rotate];*/
        
        
        
        /*
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        UIBezierPath *roundedPath = [UIBezierPath bezierPathWithArcCenter:center radius:size/2 startAngle:<#(CGFloat)#> endAngle:<#(CGFloat)#> clockwise:<#(BOOL)#>];    
        maskLayer.fillColor = [[UIColor whiteColor] CGColor];
        maskLayer.backgroundColor = [[UIColor clearColor] CGColor];
        maskLayer.path = [roundedPath CGPath];
        
        
        UIImageView *imageView = [ [ UIImageView alloc ] initWithFrame:CGRectMake(imgPos.x, imgPos.y, imgSize, imgSize) ];
         imageView.image = [player image];
         [imageView setCenter:CGPointMake(imgPos.x, imgPos.y)];
        imageView.layer.mask = maskLayer;
         [self addSubview:imageView];
         CGAffineTransform rotate = CGAffineTransformMakeRotation( angle+M_PI_2 );
         [imageView setTransform:rotate];*/
        
        
        
       /* 
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGMutablePathRef slice = CGPathCreateMutable();
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, center.x, center.y); 
        CGContextAddLineToPoint(context, linePos.x, linePos.y);
        //CGContextAddLineToPoint(context, nextlinePos.x, nextlinePos.y);
       // CGPoint curvePoint = [self getCirclePoint:size*(2/3) pos:center angle:angle+step];
        //CGContextAddCurveToPoint(context, center.x, center.y,center.x, center.y, nextlinePos.x, nextlinePos.y);
        CGContextAddArc(context, center.x, center.y, size/2, angle+step/2, angle+step/2+step, false);
        CGContextClosePath(context);
        
        // Fill the path
        CGContextSetFillColorWithColor(context, [imgPattern CGColor]);
        CGContextFillPath(context);
        CGPathRelease(slice);*/
    }
    
    CGContextStrokePath(context);
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
}
- (CGPoint) getCirclePoint: (CGFloat) diam pos:(CGPoint) pos angle: (CGFloat) angle{
    return CGPointMake(diam*(cosf(angle))+pos.x,diam*(sinf(angle))+pos.y);
}

@end
