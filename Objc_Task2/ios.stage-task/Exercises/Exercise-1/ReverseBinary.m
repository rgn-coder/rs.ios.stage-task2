#import "ReverseBinary.h"



NSMutableArray * getNumberFromDecimalSystem(UInt8 n) {
    NSMutableArray *arrayForBinarySystem = [NSMutableArray new];
    NSString *numberAppearAsString = [@(n) stringValue];
    
    while (n % 2 == 0) {
        
        if (n % 2 == 0) {
            [arrayForBinarySystem addObject: @(0)];
        }
        n = n / 2;
    }
    while (n % 2 != 0) {
        [arrayForBinarySystem addObject: @(1)];
        n = n / 2;
    }
    arrayForBinarySystem = [[[arrayForBinarySystem reverseObjectEnumerator] allObjects] mutableCopy];
    int length = 7 - arrayForBinarySystem.count;
    for (int i = 0; i <= length; i += 1) {
        [arrayForBinarySystem insertObject:@(0) atIndex:0];
    }
    return arrayForBinarySystem;
}

UInt8 getNumberFromBinarySystem(NSArray <NSNumber *> *array) {
    int answer = 0;
    for (int i = 0; i < array.count; i += 1) {
        int element = array[i].intValue;
        answer += element * pow(2, array.count - 1 - i);
        
        
    }
    return answer;
}


UInt8 ReverseInteger(UInt8 n) {
    if (n == 0) {
        return 0;
    }
    NSMutableArray *binaryArray = getNumberFromDecimalSystem(n);
    binaryArray = [[[binaryArray reverseObjectEnumerator] allObjects] mutableCopy];
    int decimalAnswer = getNumberFromBinarySystem(binaryArray);
    return decimalAnswer;
}


