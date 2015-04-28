下划线是反人类的设置，看看还可以，手敲就。。。

//  define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//  define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS


constraint
    make        添加  add
    update      更新  
    remake      去掉重做

constant
edges insets

margin


?
MASConstraint *(^attributes)(MASAttribute attrs); 


MASConstraint *edges;
    MASConstraint *left;
    MASConstraint *top;
    MASConstraint *right;
    MASConstraint *bottom;


MASConstraint *size;
    MASConstraint *width;
    MASConstraint *height;


MASConstraint *center;
    MASConstraint *centerX;
    MASConstraint *centerY;


MASConstraint *leading;
MASConstraint *trailing;
MASConstraint *baseline;




MASConstraint *leftMargin;
MASConstraint *rightMargin;
MASConstraint *topMargin;
MASConstraint *bottomMargin;
MASConstraint *leadingMargin;
MASConstraint *trailingMargin;
MASConstraint *centerXWithinMargins;
MASConstraint *centerYWithinMargins;