//
//  DekripsiRsaViewController.h
//  Simulasi Kriptografi 2
//
//  Created by Steven Renaldo Antony on 10/4/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DekripsiRsaViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textP;
@property (weak, nonatomic) IBOutlet UITextField *textQ;
@property (weak, nonatomic) IBOutlet UITextField *textE;
@property (weak, nonatomic) IBOutlet UITextField *textC;
- (IBAction)ok:(id)sender;

@end
