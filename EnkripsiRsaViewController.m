//
//  EnkripsiRsaViewController.m
//  Simulasi Kriptografi 2
//
//  Created by Steven Renaldo Antony on 10/4/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import "EnkripsiRsaViewController.h"
#import "DisplayEnkripsiRsaViewController.h"

@interface EnkripsiRsaViewController ()

@end

@implementation EnkripsiRsaViewController

-(Boolean)cekPrima : (int) angka{
    int counter = 0;
    for (int i = 1;i <= angka; i++) {
        if((angka % i) == 0){
            counter++;
        }
    }
    if(counter == 2){
        return true;
    }else{
        return false;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (IBAction)ok:(id)sender {
    NSString *p = _textP.text;
    NSString *q = _textQ.text;
    NSString *e = _textE.text;
    NSString *m = _textM.text;
    
    //cek error
    if([p isEqualToString:@""] || [q isEqualToString:@""] || [e isEqualToString:@""] || [m isEqualToString:@""]){
        //tampilkan pesan input tidak boleh kosong
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Terjadi Kesalahan" message:@"Semua input harus terisi" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    else if(![p integerValue] || ![q integerValue] || ![e integerValue] || ![m integerValue]){
        //tampilkan pesan semua input harus angka
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Terjadi Kesalahan" message:@"Semua inputan harus angka" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }else if([self cekPrima:[e intValue]]==false || ([self cekPrima:[e intValue]] == true && (([p intValue]-1)*([q intValue]-1)%[e intValue] < 1))){
        //tampilkan pesan e harus coprime
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Terjadi Kesalahan" message:@"Inputan e harus prima dan coprime dengan (p-1)x(q-1)" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }else{
        //panggil segue
        [self performSegueWithIdentifier:@"showEnkripsiRsa" sender:self];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //baca input
    NSString *p = _textP.text;
    NSString *q = _textQ.text;
    NSString *e = _textE.text;
    NSString *m = _textM.text;
    
    //kirim input ke controller tujuan
    DisplayEnkripsiRsaViewController *dervc = segue.destinationViewController;
    //set properti pada controller tujuan
    dervc.inputP = [p intValue];
    dervc.inputQ = [q intValue];
    dervc.inputE = [e intValue];
    dervc.inputM = [m intValue];
}

@end
