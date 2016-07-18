//
//  ViewController.m
//  EjemploKVO
//
//  Created by Seba on 18/7/16.
//  Copyright © 2016 Seba. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    [self addObserver:self forKeyPath:@"ObjStepper.value" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:NULL];
    
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqual:@"ObjStepper.value" ]) {
        NSNumber * myDoubleNumber = [NSNumber numberWithDouble: self.ObjStepper.value ];
        
        NSLog(@"ArrayDictonary %@ ",[change description]);
       NSNumber *valueNew = [change objectForKey: @"new"];
       NSNumber *valueOld = [change objectForKey: @"old"];

        self.LabelStepper.text = [ myDoubleNumber stringValue]  ;
        
       if([valueNew intValue] > [valueOld intValue] ){
            self.LabelNotification.text = @"+";
        }else{
            self.LabelNotification.text = @"-";

        }
        
    }
    
}
-(void)dealloc{
    [self superclass];
    [self removeObserver:self forKeyPath:@"ObjStepper.value"];
}
@end
