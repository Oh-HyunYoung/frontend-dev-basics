/**
 * Array 확장(prototype 기반의 확장)
 * List 함수
 * 
 */

Array.prototype.remove = function (index) {
    this.splice(index, 1);
}

Array.prototype.insert = function (index, value) {
    if (value instanceof Array) {
        // for (var i = 0; i < value.length; i++) {
        //     this.splice(index + i, 0, value[i]);
        // }

        // 오류!!
        // 콜백함수 안의 this는 어휘 상의 this와 일치하지 않는다.
        // value.forEach(function(e) {
            //    this.splice(index++, 0, e);            
        // });


        // 해결 방법1
        // var _this = this;
        // value.forEach(function(e) {
        //     _this.splice(index++, 0, e);            
        // });

        // 해결 방법2
        // Function.prototype.bind() 함수를 사용한다.
        // 콜백 함수 블록 안의 this를 세팅할 수 있다.
        value.forEach(function(e) {
               this.splice(index++, 0, e);            
        }.bind(this));
    } else {
        this.splice(index, 0, value);
    }
}

// List 함수 사용하기
var a = [1, 2, 4];
console.log(a);

a.insert(2, 3);
console.log(a);

a.remove(2);
console.log(a);

a.insert(2, ['a', 'b', 'c']);
console.log(a);




