//
//  MyView.m
//  MyRefresh
//
//  Created by tonniegao on 2016/11/24.
//  Copyright © 2016年 lagou. All rights reserved.
//

#import "MyView.h"
#import "UIView+CVUIViewAdditions.h"

@implementation MyView {
    CGFloat _a;
    CGFloat _b;
    CGFloat _c;
    CGFloat _unit;//刻度单位
    CGFloat _unitCount;//每个半轴个数
    CGFloat _unitLength;//刻度间距长度
    CGFloat _unitTLength;//刻度真正长度
    CGFloat _centerX;//中心x
    CGFloat _centerY;//中心y
}

- (void)setA:(CGFloat)a {
    _a = a;
    [self setA:_a b:_b c:_c];
}
- (void)setB:(CGFloat)b {
    _b = b;
    [self setA:_a b:_b c:_c];
}
- (void)setC:(CGFloat)c {
    _c = c;
    [self setA:_a b:_b c:_c];
}

- (void)setA:(CGFloat)a b:(CGFloat)b c:(CGFloat)c {
    _a = a;
    _b = b;
    _c = c;
    
    _unit = 10;
    _unitLength = 20.f;
    _unitCount = 5;
    _centerX = self.width/2;
    _centerY = self.height/2;
    _unitTLength = 3.f;
    
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    //画xy轴
    [self drawXYLine:context];
    
    //画抛物线
    [self drawCurve:context];
    
    //画名字
    [self drawName:context];
//    CGContextRelease(context);
}

//画名字
- (void)drawName:(CGContextRef)context {
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);//黑色
    CGContextSetLineWidth(context, 1.0);//线的宽度
    
    [[NSString stringWithFormat:@"y = %.2fx^2 %@%2.fx %@%2.f", _a, _b >= 0 ? @"+" : @"", _b, _c >= 0 ? @"+" : @"", _c] drawAtPoint:CGPointMake(5, 5) withAttributes:@{}];
    
    CGContextStrokePath(context);
}

//画抛物线
- (void)drawCurve:(CGContextRef)context {
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);//黑色
    CGContextSetLineWidth(context, 1.0);//线的宽度
    
    //画抛物线
    CGFloat leftX = _centerX - (_unitCount + 1)*_unitLength;
    //起始点固定
    CGContextMoveToPoint(context, leftX, [self functionFromeLeftX:leftX]);
    while (leftX <= _centerX + (_unitCount + 1)*_unitLength) {
        CGFloat space = 0.05f;
        leftX += space;
        CGContextAddLineToPoint(context, leftX, [self functionFromeLeftX:leftX]);
    }
    
    CGContextStrokePath(context);
}

//函数求值
- (CGFloat)functionFromeLeftX:(CGFloat)leftX {
    CGFloat x = leftX - _centerX;
    //转化x成函数的x
    x = x * _unit / _unitLength;
    
    CGFloat y = _a*powf(x, 2) + _b*x + _c;
    //转化函数的y成view的y值
    y = y * _unitLength / _unit;
    return _centerY - y;
}

//画xy轴 中心显示
- (void)drawXYLine:(CGContextRef)context {
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);//黑色
    CGContextSetLineWidth(context, 1.0);//线的宽度
    //x轴
    CGContextMoveToPoint(context, _centerX - (_unitCount + 1)*_unitLength, _centerY);
    CGContextAddLineToPoint(context, _centerX + (_unitCount + 1)*_unitLength, _centerY);
    //y轴
    CGContextMoveToPoint(context, _centerX, _centerY - (_unitCount + 1)*_unitLength);
    CGContextAddLineToPoint(context, _centerX, _centerY + (_unitCount + 1)*_unitLength);
    
    //x箭头
    CGFloat r = 0.6;
    CGContextMoveToPoint(context, _centerX + (_unitCount + 1)*_unitLength - _unitLength*r, _centerY - _unitLength*r);
    CGContextAddLineToPoint(context, _centerX + (_unitCount + 1)*_unitLength, _centerY);
    CGContextAddLineToPoint(context, _centerX + (_unitCount + 1)*_unitLength - _unitLength*r, _centerY + _unitLength*r);
    //y箭头
    CGContextMoveToPoint(context, _centerX - _unitLength*r, _centerY - (_unitCount + 1)*_unitLength + _unitLength*r);
    CGContextAddLineToPoint(context, _centerX, _centerY - (_unitCount + 1)*_unitLength);
    CGContextAddLineToPoint(context, _centerX + _unitLength*r, _centerY - (_unitCount + 1)*_unitLength + _unitLength*r);
    
    //x刻度
    for (int i = 0; i < _unitCount * 2 + 1; i++) {
        CGContextMoveToPoint(context, _centerX - (_unitCount - i) *_unitLength, _centerY - _unitTLength);
        CGContextAddLineToPoint(context, _centerX - (_unitCount - i)*_unitLength, _centerY);
        
        CGContextMoveToPoint(context, _centerX, _centerY - (_unitCount - i)*_unitLength);
        CGContextAddLineToPoint(context, _centerX + _unitTLength, _centerY - (_unitCount - i)*_unitLength);
    }
    //画出来 一定要写啊
    CGContextStrokePath(context);
}

@end
