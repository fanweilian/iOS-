//
//  ViewController.m
//  抽奖
//
//  Created by fanweilian on 16/9/28.
//  Copyright © 2016年 fanweilian. All rights reserved.
//

#import "ViewController.h"
#import "PrizeView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setuPrize];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)setuPrize{

    PrizeView *prize = [[PrizeView alloc] initWithFrame:self.view.bounds];
    NSArray *imagesName = @[@"add-to-favorite",@"add",@"appointment-cool",@"appointment-urgent",@"appointment",@"audio-cd",@"audio-document",@"backup-green-button"];
    prize.imageArray = [NSMutableArray arrayWithArray:imagesName];
    [self.view addSubview:prize];
    
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
