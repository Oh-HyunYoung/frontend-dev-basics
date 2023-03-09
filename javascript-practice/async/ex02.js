const myAsyncFn02 = function(param){
    return new Promise(function(resolve, reject) {

    
        //
        // 비동기 코드 
        // 파일 시스템 접근(file io), 네트워크 통신, SQL to DB, setTimeout
        //
        setTimeout(function() {
            if(param === 'data') {
                resolve('ok');
            } else {
                reject(new Error('fail'));
            } 
        }, 2000);
    });
}

if(require.main == module){
// test01: success
myAsyncFn02("") // "" 는 fail or "data" 는 success
    .then(function(result){
    console.log(result);
    })

// test02: fail
    .catch(function(error){
    console.error(error);
    });
    
    console.log("wait........");
} else {
    module.exports= myAsyncFn02;
}