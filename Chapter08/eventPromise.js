var myEvent = instance.ageRead({fromBlock: 25000, toBlock: 'latest'});
myEvent.watch(function(error, result){
    if(error) {
        console.log(error); 
    } 
    console.log(result.args)
});


var myEvent = instance.allEvents({fromBlock: 24000, toBlock: 'latest'});
myEvent.watch(function(error, result){
    if(error) {
        console.log(error); 
    } 
    console.log(result)
});