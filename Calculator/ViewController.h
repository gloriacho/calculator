//
//  ViewController.h
//  Calculator
//
//  Created by MF839-016 on 2016. 6. 15..
//  Copyright © 2016년 MF839-016. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoViewController.h"

@interface ViewController : UIViewController <InfoViewProtocol>
@property (strong, nonatomic) IBOutlet UILabel *display;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btnOpCollections;

@property (strong, nonatomic) IBOutlet UIButton *btnDiv;
@property (strong, nonatomic) IBOutlet UIButton *btnSub;
@property (strong, nonatomic) IBOutlet UIButton *btnPlus;
@property (strong, nonatomic) IBOutlet UIButton *btnMulti;

- (void) processDigit: (int) digit;
- (void) processOp: (char)TheOp;
- (void) storeFracPart;

- (IBAction)clickDigit:(id)sender;

- (IBAction)clickPlus:(id)sender;
- (IBAction)clickMinus:(id)sender;
- (IBAction)clickMultiply:(id)sender;
- (IBAction)clickDivide:(id)sender;//story board connect - (IBAction)

- (IBAction)unwindToViewController:(UIStoryboardSegue *)sender;

- (IBAction)clickOver:(id)sender;
- (IBAction)clickEquals:(id)sender;
- (IBAction)clickClear:(id)sender;

- (IBAction)openInfoView:(UIButton *)sender;
- (IBAction)openNewView:(UIButton *)sender;
- (void) SetButtonEnabled: (BOOL) b;

- (void) changeColor:(UIColor *)newColor;
@end

