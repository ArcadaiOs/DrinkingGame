//
//  DGRandomShotWheel.m
//  DrinkingGame
//
//  Created by student on 2/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGRandomShotWheel.h"

@implementation DGRandomShotWheel

- (id)initWithFrame:(CGRect)frame andController:(DGController*) controllerIn
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        controller = controllerIn;
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    int i;
    float angle,x,y;
    DGPlayer* player;
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    CGFloat components[] = {0.0, 0.0, 1.0, 1.0};
    
    CGColorRef color = CGColorCreate(colorspace, components);
    
    CGContextSetStrokeColorWithColor(context, color);
    
    int count = [controller.players count];
    NSLog(@"players: %i",count);
    for(i=0;i<count;i++){
        player = [[controller players] objectAtIndex:i];
        angle = M_PI * 2 * (float)(i+1)/count;
        NSLog(@"angle: %f",angle);
        x = 320 * (cosf(angle))+320;
        y = 320 * (sinf(angle))+320;
        CGContextMoveToPoint(context, 320, 320);
        CGContextAddLineToPoint(context, x, y);
        
    
        UIImageView *imageView = [ [ UIImageView alloc ] initWithFrame:CGRectMake(x, y, 100, 100) ];
        imageView.image = [player image];
        [self addSubview:imageView];
        //CGAffineTransform rotate = CGAffineTransformMakeTranslation(-50, -50);
        CGAffineTransform rotate = CGAffineTransformMakeRotation( angle+M_PI_2 );
        //CGAffineTransformRotate(rotate, angle+M_PI_2);
        //CGAffineTransformTranslate(rotate, 50, 50);
        [imageView setTransform:rotate];
    }
    
    /*UIImage *image = [UIImage imageNamed:@"soini.jpeg"];
    UIImageView *imageView = [ [ UIImageView alloc ] initWithFrame:CGRectMake(0.0, 0.0, image.size.width, image.size.height) ];
    imageView.image = image;
    [self addSubview:imageView];
    CGAffineTransform rotate = CGAffineTransformMakeRotation( 1.0 / 180.0 * 3.14 );
    [imageView setTransform:rotate];*/
    
    CGContextAddEllipseInRect(context, rect);
    
    CGContextStrokePath(context);
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
}


@end
