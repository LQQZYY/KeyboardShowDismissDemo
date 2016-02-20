//
//  ViewController.m
//  监听键盘弹出消失
//
//  Created by Artron_LQQ on 16/2/20.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "ViewController.h"

#import "LQQMonitorKeyboard.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITextField *text = [[UITextField alloc]init];
    text.frame = CGRectMake((self.view.frame.size.width - 200)/2, self.view.frame.size.height - 40, 200, 40);
    text.backgroundColor = [UIColor redColor];
    text.borderStyle = UITextBorderStyleRoundedRect;
    
    [self.view addSubview:text];
    
    [LQQMonitorKeyboard LQQAddMonitorWithShowBack:^(NSInteger height) {
        
        text.frame = CGRectMake((self.view.frame.size.width - 200)/2, self.view.frame.size.height - 40 - height, 200, 40);
        NSLog(@"键盘出现了 == %ld",(long)height);
        
    } andDismissBlock:^(NSInteger height) {
        
        text.frame = CGRectMake((self.view.frame.size.width - 200)/2, self.view.frame.size.height - 40, 200, 40);
        NSLog(@"键盘消失了 == %ld",(long)height);
        
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
