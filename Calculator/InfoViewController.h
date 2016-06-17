//
//  InfoViewController.h
//  Calculator
//
//  Created by MF839-016 on 2016. 6. 16..
//  Copyright © 2016년 MF839-016. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InfoViewProtocol <NSObject>

-(void) changeColor:(UIColor *)newColor;

@end

@interface InfoViewController : UIViewController
- (IBAction)close:(id)sender;
- (IBAction)changeColor:(id)sender;
@property (nonatomic, weak) NSString *myString;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (nonatomic, strong) id<InfoViewProtocol> delegate;


@end
