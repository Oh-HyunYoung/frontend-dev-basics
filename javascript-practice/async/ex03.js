const fetch = require('./ex02');

const ex03 = async function(param) {
    try {
        const data = await fetch(param);
        console.log(data);
    } catch(err){
        console.error(err);
    }
}

ex03("data");
console.log("wait.....");

