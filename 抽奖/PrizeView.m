//
//  PrizeView.m
//  抽奖
//
//  Created by fanweilian on 16/9/29.
//  Copyright © 2016年 fanweilian. All rights reserved.
//

#import "PrizeView.h"

#define iconWidth    60
#define space        20
//static  NSTimeInterval SpaceTime = 0.1;
@interface PrizeView (){
    NSTimer *imageTimer;
}

@property (nonatomic,strong) UIButton *selectBtn;       //当前选中的图标
@property (nonatomic,strong) NSMutableArray *btnArray; //图标数组
@property (nonatomic,strong) UIButton *startBtn;       //开始按钮
@property (nonatomic,assign) BOOL isON;                //是否正在开始
@property (nonatomic,assign) NSTimeInterval SpaceTime; //间隔
@end


@implementation PrizeView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupSubViews];
        _selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectBtn.layer.cornerRadius = 10;
        _selectBtn.backgroundColor = [UIColor yellowColor];
        _selectBtn.frame = CGRectMake(0, 0, iconWidth, iconWidth);
        _selectBtn.alpha = 0.5;
        _isON = YES;
        
    _btnArray = [NSMutableArray array];
    _SpaceTime = 0.1;
    }
    return self;

}
- (NSMutableArray *)ImageArray{
    if (!_imageArray) {
        _imageArray = [NSMutableArray array];
    }

    return _imageArray;

}

- (void)setImageArray:(NSMutableArray *)imageArray{
    
    _imageArray = imageArray;
    
    [self setupSubViews];
    
    

}
- (void)setupSubViews{

    
    CGFloat spaceH = (self.frame.size.width - iconWidth*3 - space *2)/2;
    CGFloat spaceV = (self.frame.size.height - iconWidth*3 - space *2)/2;
    CGFloat btnWeidth = iconWidth;
    CGFloat btnHeight = iconWidth;
    CGFloat orignX;
    CGFloat orginY;
    for (int i=0; i<_imageArray.count+1;i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        orignX = spaceH + i%3*(btnWeidth + space);
        orginY = spaceV + i/3*(btnHeight + space);
        [btn setFrame:CGRectMake(orignX, orginY, btnWeidth, btnHeight)];
        btn.layer.cornerRadius = 10;
        btn.tag = i > 4? i -1: i;
        [self addSubview:btn];
        if (i == 4) {
            [btn setTitle:@"开始" forState:UIControlStateNormal];
            [btn setBackgroundColor: [UIColor redColor]];
            [btn addTarget:self action:@selector(startGame) forControlEvents:UIControlEventTouchUpInside];
            _startBtn = btn;
        }else{
        
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, btnWeidth,btnHeight)];
            [btn addSubview:imageView];
            imageView.image = [UIImage imageNamed:[_imageArray objectAtIndex:i > 4? i -1: i]];
        }
        
        if (i==0) {
            [btn addSubview:_selectBtn];
        }
        if (i != 4) {
         
            [_btnArray addObject:btn];
        }
    }
    
    [_btnArray exchangeObjectAtIndex:3 withObjectAtIndex:7];
    [_btnArray exchangeObjectAtIndex:3 withObjectAtIndex:4];
    [_btnArray exchangeObjectAtIndex:5 withObjectAtIndex:6];
    
}

- (void)startGame{

    
    if (_isON) {
       [_startBtn setTitle:@"暂停" forState:UIControlStateNormal];
        imageTimer = [NSTimer scheduledTimerWithTimeInterval:_SpaceTime target:self selector:@selector(updataImage:) userInfo:nil repeats:YES];
        _isON = NO;
    
    }else{
    
        [imageTimer invalidate];
        _isON = YES;
        [_startBtn setTitle:@"开始" forState:UIControlStateNormal];
    
    }
    
    
}
- (void)updataImage:(NSTimer *)timer {
    _SpaceTime +=0.1;
    
    NSLog(@"timw:%f",_SpaceTime);
    NSLog(@"点击了");
    static int index=0;
    UIButton *btn = _btnArray[index];
    NSLog(@"数组个数：%ld",_btnArray.count);
    index ++;
    if (index > 7 ) {
        index =0;
        
    }
    [UIView animateWithDuration:0 animations:^{
        
        [btn addSubview:_selectBtn];
        
    }];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
