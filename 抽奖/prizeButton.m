//
//  prizeButton.m
//  抽奖
//
//  Created by fanweilian on 16/9/28.
//  Copyright © 2016年 fanweilian. All rights reserved.
//

#import "prizeButton.h"

@implementation prizeButton

- (void)setX:(CGFloat)x{

    CGRect btnFrame = self.frame;
    btnFrame.origin.x = x;
    self.frame = btnFrame;


}

- (CGFloat)x{

    return self.frame.origin.x;


}

- (void)setY:(CGFloat)y{
    
    CGRect btnFrame = self.frame;
    btnFrame.origin.y = y;
    self.frame = btnFrame;
    
    
}

- (CGFloat)y{
    
    return self.frame.origin.y;
    
    
}
- (void)setWidth:(CGFloat)width{
    
    CGRect btnFrame = self.frame;
    btnFrame.size.width = width;
    self.frame = btnFrame;
    
    
}

- (CGFloat)width{
    
    return self.frame.size.width;
    
    
}
- (void)setHeight:(CGFloat)height{
    
    CGRect btnFrame = self.frame;
    btnFrame.size.width = height;
    self.frame = btnFrame;
    
    
}

- (CGFloat)height{
    
    return self.frame.size.height;
    
    
}

@end
