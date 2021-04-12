//
//  TestOC.m
//  Example
//
//  Created by Harvey on 2021/4/12.
//

#import "TestOC.h"
#import "Example-Swift.h"

@implementation TestOC

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [MyDisk setValue:@"ldldl" key:CKKey.mykey1];
        CKValue *value = [MyDisk valueWithKey:CKKey.mykey1];
        
        //[MyDisk setValue:<#(nullable id)#> forKeyPath:<#(nonnull NSString *)#>];
        
    }
    return self;
}
@end
