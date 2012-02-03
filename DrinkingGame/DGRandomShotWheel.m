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
    float spin = M_PI + M_PI_2;//sel*step + M_PI_2 -step/2;
    NSLog(@"spin: %f",spin);
    NSLog(@"step: %f",step);
    CABasicAnimation* spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    spinAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    spinAnimation.toValue = [NSNumber numberWithFloat:spin];
    spinAnimation.removedOnCompletion = NO;
    spinAnimation.fillMode = kCAFillModeForwards;
    [spinAnimation setDuration:sel+1];
    [self.layer addAnimation:spinAnimation forKey:@"spinAnimation"];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = NULL;
    int bitmapBytesPerRow = 480 * 4;
    int bitmapByteCount = bitmapBytesPerRow * 320;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    char* byteArr = (char*)malloc(bitmapByteCount);
    ctx = CGBitmapContextCreate(byteArr, 480, 320, 8, bitmapBytesPerRow, colorSpace, kCGImageAlphaPremultipliedLast);
    CGColorSpaceRelease( colorSpace );// 6
    
    CGContextSetRGBFillColor (ctx, 1, 1, 0, 1);
    // Y is flipped
    CGContextTranslateCTM(ctx, 0, 320);
    CGContextScaleCTM(ctx, 1.0, -1.0);
    
    
    
    int i;
    float angle,lineWidth = 2.0f, size = 600, imgSize = 200;
    DGPlayer* player;
    CGPoint linePos;
    CGPoint nextlinePos;
    CGPoint center = CGPointMake(rect.size.width/2, rect.size.height/2);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, lineWidth);
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    CGFloat components[] = {0.0, 0.0, 1.0, 1.0};
    
    CGColorRef color = CGColorCreate(colorspace, components);
    
    CGContextSetStrokeColorWithColor(context, color);
    
    for(i=0;i<count;i++){
        player = [[controller players] objectAtIndex:i];
        UIColor* imgPattern = [UIColor colorWithPatternImage: [player image]];
        //UIColor* imgPattern = [[UIColor alloc] initWithRed:20.0 / 255 green:59.0 / 255 blue:102.0 / 255 alpha:1.0];
        angle = step * (i+1);
        CGPoint imgPos = [self getCirclePoint:size/2-imgSize/2-30 pos:center angle:angle];
        if(i==0){
            linePos = [self getCirclePoint:size/2 pos:center angle:angle+step/2];
        }else{
            linePos = nextlinePos;
        }
        nextlinePos = [self getCirclePoint:size/2 pos:center angle:angle+step/2+step];
        CGContextMoveToPoint(context, rect.size.width/2, rect.size.height/2);
        CGContextAddLineToPoint(context, linePos.x, linePos.y);
        
    
        /*UIImageView *imageView = [ [ UIImageView alloc ] initWithFrame:CGRectMake(imgPos.x, imgPos.y, imgSize, imgSize) ];
        imageView.image = [player image];
        [imageView setCenter:CGPointMake(imgPos.x, imgPos.y)];
        [self addSubview:imageView];
        CGAffineTransform rotate = CGAffineTransformMakeRotation( angle+M_PI_2 );
        [imageView setTransform:rotate];*/
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGMutablePathRef slice = CGPathCreateMutable();
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, center.x, center.y); 
        CGContextAddLineToPoint(context, linePos.x, linePos.y);
        CGContextAddLineToPoint(context, nextlinePos.x, nextlinePos.y);
        CGContextClosePath(context);
        
        // Fill the path
        CGContextSetFillColorWithColor(context, [imgPattern CGColor]);
        CGContextFillPath(context);
        CGPathRelease(slice);
    }
    NSLog(@"%f\t%f\t%f\t%f",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
    CGContextAddEllipseInRect(context, CGRectMake((rect.size.width-size)/2, (rect.size.height-size)/2, size, size));
    
    CGContextStrokePath(context);
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
}
- (CGPoint) getCirclePoint: (CGFloat) diam pos:(CGPoint) pos angle: (CGFloat) angle{
    return CGPointMake(diam*(cosf(angle))+pos.x,diam*(sinf(angle))+pos.y);
}

@end
