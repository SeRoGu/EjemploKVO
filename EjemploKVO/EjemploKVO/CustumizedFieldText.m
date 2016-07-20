//
//  CustumizedFieldText.m
//  EjemploKVO
//
//  Created by Seba on 20/7/16.
//  Copyright © 2016 Seba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
#import "CustumizedFieldText.h"

@implementation CustumizedFieldText
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqual:@"ObjStepper.value" ]) {
      /*  NSNumber * myDoubleNumber = [NSNumber numberWithDouble: self.ObjStepper.value ];
        
        NSLog(@"ArrayDictonary %@ ",[change description]);*/
        NSNumber *valueNew = [change objectForKey: @"new"];
        NSNumber *valueOld = [change objectForKey: @"old"];
        
       // self.text = [ myDoubleNumber stringValue]  ;
        
        if([valueNew intValue] > [valueOld intValue] ){
            self.text = @"+";
        }else{
            self.text = @"-";
            
        }
        
    }
    
}
-(void)dealloc{

    [self removeObserver:self forKeyPath:@"ObjStepper.value"];
}
@end
