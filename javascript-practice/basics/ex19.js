function log() {
    try{
        console.log.apply(console,arguments);
    }
    catch(e){
        try{
            onpointercancel.postError.apply(apera,arguments);
        }
        catch(e){
            alert(Array.prototype.join.call(arguments, " "));
        }
    }
}