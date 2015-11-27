//
//  ViewController.m
//  QYNodeDemo
//
//  Created by Adele on 15/11/27.
//  Copyright (c) 2015年 lqy. All rights reserved.
//

#import "ViewController.h"

#import "NSTimer+QYAddExtensions.h"
#import "UIAlertView+QYAddExtensions.h"

@interface ViewController (){
    NSTimer *_timer;
    
    
}
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (void)dealloc{
    NSLog(@"%s%d",__func__,__LINE__);
    [self.timer invalidate];
    self.timer = nil;
}

- (IBAction)returnClick:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)alertTest:(id)sender {
    [[UIAlertView alertWithTitle:@"我是block测试回调信息" message:@"测试信息" block:^(UIAlertView *alertView, NSInteger clickIndex) {
        NSLog(@"--- alertView:%@ ---index:%ld",alertView,clickIndex);
    } cancelButtonTitle:@"取消" otherButtonTitles:nil] show];
}

- (IBAction)timerTest:(id)sender {
    [self presentViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([self class])] animated:YES completion:^{
        
    }];
}

- (IBAction)statusWithTimer:(id)sender {
    
    if ([sender tag] == 0) {
        [sender setTag:1];
        [sender setTitle:@"stop" forState:UIControlStateNormal];
        [sender setBackgroundColor:[UIColor greenColor]];
        [self.timer setFireDate:[NSDate date]];
    }else{
        [sender setTag:0];
        [sender setTitle:@"begin" forState:UIControlStateNormal];
        [sender setBackgroundColor:[UIColor redColor]];
        [self.timer fire];
    }
    
}

- (NSTimer *)timer{
    if (!_timer) {
        static int timerCount = 0;
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES executiveBlock:^(NSTimer *timer) {
            NSLog(@"timer count :%d",++timerCount);
        }];
        [_timer fire];
    }
    return _timer;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}


@end
