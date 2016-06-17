//
//  InfoViewController.m
//  Calculator
//
//  Created by MF839-016 on 2016. 6. 16..
//  Copyright © 2016년 MF839-016. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"Text = %@",  self.myString);
    
    self.myLabel.text = self.myString;//속성을 따라 갈 수 있음..
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation




- (IBAction)close:(id)sender
{
    [self.presentingViewController
     dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)changeColor:(id)sender {
    
    if([self.delegate respondsToSelector:@selector(changeColor:)])
        [self.delegate changeColor:[UIColor blackColor]];
}
@end
