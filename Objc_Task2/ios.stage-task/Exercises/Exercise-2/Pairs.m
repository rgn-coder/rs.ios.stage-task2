#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    int count = 0;
    for (int a = 1; a < array.count; a += 1) {
        for (int i = array.count - 2; i >= 0; i -= 1) {
            if (array[array.count - a].intValue - array[i].intValue == number.intValue) {
                count += 1;
            }
        }
    }
    return count;
}

@end
